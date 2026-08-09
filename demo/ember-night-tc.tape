# ember-night-tc — dark, opaque, warm neutrals.
#
# This scheme paints its own background, so it looks identical on every
# terminal. The Theme background here matches the scheme's own #191512 purely
# so the padding around the editor blends instead of framing it.
#
# Render from the repository root:  vhs demo/ember-night-tc.tape

Output demo/out/ember-night-tc.gif

Require micro

Set Shell "bash"
Set FontSize 16
Set Width 1100
Set Height 760
Set Padding 24
Set Theme { "background": "#191512", "foreground": "#EDE6DA", "cursor": "#F2AB6B" }

# Launch off-camera so the picture is the editor, not a shell prompt, then
# hold still long enough for vhs to have frames to record.
Hide
Type "demo/preview.sh ember-night-tc" Enter
Sleep 4s
Show
Sleep 2s
Screenshot demo/out/ember-night-tc.png
