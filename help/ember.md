# ember

Four truecolor colorschemes built around one warm accent language: coral
keywords, amber functions, olive strings, and a single cool teal anchor for
types. They differ in what sits behind that palette.

| Colorscheme        | Background | Neutrals | Use it when                                  |
|--------------------|------------|----------|-----------------------------------------------|
| `ember-dusk-tc`    | dark, transparent | warm  | You want your wallpaper showing through        |
| `ember-slate-tc`   | dark, transparent | cool  | Same, but over cool or photographic wallpapers |
| `ember-night-tc`   | dark, opaque      | warm  | You want the theme to look identical everywhere |
| `ember-paper-tc`   | light, opaque     | warm  | Daylight, or a light terminal                   |

Activate one with:

```
> set colorscheme ember-dusk-tc
```

## Transparency

`ember-dusk-tc` and `ember-slate-tc` set no background on the `default` group,
so your terminal background shows through the editor area. The chrome —
statusline, tabbar, cursor line, selection — stays solid so you never lose
track of where the cursor is.

If your terminal background is a colour these themes were not designed
against, or you use a busy wallpaper, prefer `ember-night-tc`, which paints a
warm charcoal canvas (`#191512`) and therefore looks the same everywhere.

## Truecolor required

All four are `-tc` schemes and assume 24-bit colour. Make sure your terminal
supports it and that micro knows:

```
> set truecolor on
```

Then restart micro. On a 256-colour terminal these will fall back to
approximations and the palette will not look right.

## Light theme contrast

`ember-paper-tc` is not a naive inversion. The accents are darkened so each
highlight group clears roughly 4.5:1 against the `#FBF6EA` canvas, rather than
rotating the dark palette up in lightness and leaving the yellows unreadable.
