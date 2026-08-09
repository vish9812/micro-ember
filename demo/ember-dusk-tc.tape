# ember-dusk-tc — dark, transparent, warm neutrals.
#
# This scheme sets no background, so the terminal shows through the editor
# area. The Theme background below stands in for your wallpaper; the solid
# statusline and cursor line are the scheme's own.
#
# Render from the repository root:  vhs demo/ember-dusk-tc.tape

Output demo/out/ember-dusk-tc.gif

Require micro

Set Shell "bash"
Set FontSize 16
Set Width 1100
Set Height 760
Set Padding 24
Set Theme { "background": "#2A1E17", "foreground": "#EAE3D6", "cursor": "#F0A868" }

# Launch off-camera so the picture is the editor, not a shell prompt, then
# hold still long enough for vhs to have frames to record.
Hide
Type "demo/preview.sh ember-dusk-tc" Enter
Sleep 4s
Show
Sleep 2s
Screenshot demo/out/ember-dusk-tc.png
