#!/bin/sh
# Screenshot one ember colorscheme in a real WezTerm, on a virtual X display.
#
#     demo/capture.sh ember-dusk-tc
#     demo/capture.sh                  # all four
#
# vhs renders in its own terminal and composites onto a flat colour, so it can
# never show a wallpaper through a transparent scheme. This drives the real
# terminal instead, with the wallpaper layer that makes those schemes what they
# are — on Xvfb, so nothing appears on the desktop and an overlapping window
# cannot corrupt the frame.
#
# Requires: Xvfb, wezterm, ffmpeg, xwininfo.
set -eu

repo=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
out="$repo/demo/out"
mkdir -p "$out"

for bin in Xvfb wezterm ffmpeg xwininfo; do
	command -v "$bin" >/dev/null || { echo "capture.sh: need $bin" >&2; exit 1; }
done

# Pick a display number nothing is using, so this never collides with a real
# session or a second run.
display=""
n=99
while [ $n -lt 130 ]; do
	[ -e "/tmp/.X11-unix/X$n" ] || { display=":$n"; break; }
	n=$((n + 1))
done
[ -n "$display" ] || { echo "capture.sh: no free X display" >&2; exit 1; }

Xvfb "$display" -screen 0 1920x1200x24 -nolisten tcp >/dev/null 2>&1 &
xvfb_pid=$!
trap 'kill $xvfb_pid 2>/dev/null || true' EXIT INT TERM

# Wait for the display rather than sleeping a guessed amount.
i=0
until xwininfo -display "$display" -root >/dev/null 2>&1; do
	i=$((i + 1))
	[ $i -lt 50 ] || { echo "capture.sh: Xvfb did not come up" >&2; exit 1; }
	sleep 0.1
done

shoot() {
	scheme=$1
	echo "capturing $scheme"

	DISPLAY="$display" wezterm --config-file "$repo/demo/capture.lua" \
		start -- "$repo/demo/preview.sh" "$scheme" >/dev/null 2>&1 &
	wez_pid=$!

	# There is no window manager here, so wezterm's window is the one child of
	# root and sits at 0,0. Ignore anything tiny: wezterm maps a transient 1x1
	# window before it sizes itself, and catching that yields a 1x1 capture.
	geom=""
	i=0
	while [ $i -lt 150 ]; do
		geom=$(xwininfo -display "$display" -root -children 2>/dev/null |
			awk 'match($0, /[0-9]+x[0-9]+\+[0-9]+\+[0-9]+/) {
				g = substr($0, RSTART, RLENGTH)
				split(g, a, "x")
				if (a[1] + 0 >= 200) { print g; exit }
			}')
		[ -n "$geom" ] && break
		i=$((i + 1))
		sleep 0.1
	done
	[ -n "$geom" ] || { echo "capture.sh: no window for $scheme" >&2; kill $wez_pid 2>/dev/null || true; return 1; }

	size=${geom%%+*}
	sleep 2

	# -draw_mouse 0: x11grab composites the X pointer in by default, which lands
	# an ✕ in the middle of the editor.
	ffmpeg -loglevel error -y -f x11grab -draw_mouse 0 -video_size "$size" \
		-i "$display+0,0" -frames:v 1 "$out/$scheme.png"

	kill $wez_pid 2>/dev/null || true
	wait $wez_pid 2>/dev/null || true
	echo "  -> demo/out/$scheme.png ($size)"
}

if [ $# -gt 0 ]; then
	for s in "$@"; do shoot "$s"; done
else
	for s in ember-dusk-tc ember-slate-tc ember-night-tc ember-paper-tc; do shoot "$s"; done
fi
