# ember-paper-tc — light, opaque, warm neutrals.
#
# The daylight scheme. Opaque like night, so the Theme background here just
# matches the scheme's own #FBF6EA to keep the padding from framing the editor.
#
# Render from the repository root:  vhs demo/ember-paper-tc.tape

Output demo/out/ember-paper-tc.gif

Require micro

Set Shell "bash"
Set FontSize 16
Set Width 1100
Set Height 760
Set Padding 24
Set Theme { "background": "#FBF6EA", "foreground": "#35302A", "cursor": "#A2560B" }

# Launch off-camera so the picture is the editor, not a shell prompt, then
# hold still long enough for vhs to have frames to record.
Hide
Type "demo/preview.sh ember-paper-tc" Enter
Sleep 4s
Show
Sleep 2s
Screenshot demo/out/ember-paper-tc.png
