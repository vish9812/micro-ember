# ember

Four warm truecolor colorschemes for the [micro](https://micro-editor.github.io)
editor, packaged as an installable plugin.

One accent language across all four — coral keywords, amber functions, olive
strings, one cool teal anchor for types — over four different canvases.

| Colorscheme        | Background        | Neutrals | Use it when                                     |
|--------------------|-------------------|----------|-------------------------------------------------|
| `ember-dusk-tc`    | dark, transparent | warm     | You want your wallpaper showing through          |
| `ember-slate-tc`   | dark, transparent | cool     | Same, but over cool or photographic wallpapers   |
| `ember-night-tc`   | dark, opaque      | warm     | You want the theme to look identical everywhere  |
| `ember-paper-tc`   | light, opaque     | warm     | Daylight, or a light terminal                    |

The two transparent themes leave `default` without a background so your
terminal shows through, but keep the chrome — statusline, tabbar, cursor line,
selection — solid so the cursor never gets lost.

## Install

### Via micro's plugin manager

Add this repo to `pluginrepos` in `~/.config/micro/settings.json`:

```json
"pluginrepos": ["https://raw.githubusercontent.com/vish9812/micro-ember/main/repo.json"]
```

Then:

```
> plugin install ember
```

### Manually

```sh
git clone https://github.com/vish9812/micro-ember ~/.config/micro/plug/ember
```

Either way, restart micro and pick one:

```
> set colorscheme ember-dusk-tc
```

They appear in `set colorscheme` tab-completion alongside micro's built-ins.

### Just the files

If you would rather not install a plugin, copy the four `.micro` files from
`colorschemes/` into `~/.config/micro/colorschemes/`. They work standalone —
the plugin only exists to make installation and updates a single command.

## Truecolor

All four are `-tc` schemes and need 24-bit colour:

```
> set truecolor on
```

Restart micro afterwards. On a 256-colour terminal the palette degrades to
approximations and will not look as intended.

## My other plugins

- [palette](https://github.com/vish9812/micro-palette) — a searchable palette for
  micro: help topics, options, colorschemes, open buffers and files behind one
  keystroke. Its colorscheme mode previews these four live.
- [scrollz](https://github.com/vish9812/micro-scrollz) — viewport control for
  micro: put the line you are reading where you want it on screen, and move half
  a screen without losing the cursor.
- [navz](https://github.com/vish9812/navz) — keyboard-first navigation for VS
  Code: jump to any visible word in two keystrokes.

## License

MIT
