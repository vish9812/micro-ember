# ember-slate-tc — dark, transparent, cool neutrals.
#
# The cool sibling of dusk: same ember accents, neutrals pulled toward blue so
# they sit better over cool or photographic wallpapers. Transparent, so the
# Theme background below is standing in for that wallpaper.
#
# Render from the repository root:  vhs demo/ember-slate-tc.tape

Output demo/out/ember-slate-tc.gif

Require micro

Set Shell "bash"
Set FontSize 16
Set Width 1100
Set Height 760
Set Padding 24
Set Theme { "background": "#0E1622", "foreground": "#E4E7EC", "cursor": "#EDA469" }

# Launch off-camera so the picture is the editor, not a shell prompt, then
# hold still long enough for vhs to have frames to record.
Hide
Type "demo/preview.sh ember-slate-tc" Enter
Sleep 4s
Show
Sleep 2s
Screenshot demo/out/ember-slate-tc.png
