#!/bin/sh
# Open the sample file in micro with one ember colorscheme applied, using a
# throwaway config directory so the capture never picks up personal settings.
#
# Used by the .tape files in this directory; also handy on its own:
#
#     demo/preview.sh ember-paper-tc
set -eu

scheme="${1:?usage: preview.sh <colorscheme>}"
repo=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

cfg=$(mktemp -d)
trap 'rm -rf "$cfg"' EXIT INT TERM

# The schemes work standalone, so the capture copies the .micro files in rather
# than installing the plugin — one less moving part between the source and the
# picture.
mkdir -p "$cfg/colorschemes"
cp "$repo"/colorschemes/*.micro "$cfg/colorschemes/"

cat > "$cfg/settings.json" <<JSON
{
    "colorscheme": "$scheme",
    "truecolor": "on",
    "softwrap": false,
    "savecursor": false,
    "autosave": 0
}
JSON

# Run from the sample's own directory and open it by bare name: micro puts the
# path it was given straight into the statusline, and an absolute one both
# overflows the bar and puts a home directory into a public screenshot.
cd "$repo/demo"

# micro infers truecolor from COLORTERM; the -tc schemes degrade badly without
# it, so make sure it is set rather than trusting the capture environment.
#
# Open on the Resolve signature rather than line 1 so the solid cursor line
# lands on real code — that contrast is the point of the transparent schemes.
COLORTERM=truecolor exec micro -config-dir "$cfg" sample.go +25:1
