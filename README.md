# Dotfiles

Configuration for a macOS machine: zsh, Neovim, git, Ghostty.

## Install on a new machine

```sh
xcode-select --install
git clone git@github.com:chantel-marie-diaz/chantel-marie-diaz.git ~/.werk/chantel-marie-diaz
~/.werk/chantel-marie-diaz/install_mac.zsh
```

The script is safe to re-run. Each step skips work that is already done.

## Layout

| Path | Holds |
| --- | --- |
| `home/` | The dotfiles. GNU Stow links them into `$HOME`. |
| `Brewfile` | Every package Homebrew installs: formulae, casks, uv tools, npm globals. |
| `install_mac.zsh` | The install script. |
| `archive/` | Files kept for reference only. Nothing here is maintained. |

## Stow

Stow links each file in `home/` into `$HOME`, so the repository holds the only
copy and the two cannot drift apart.

```sh
stow -d ~/.werk/chantel-marie-diaz -t ~ home   # idempotent
```

`.zshrc` is the one exception. It reads two tokens from the macOS Keychain, and
those entries do not exist yet, so a link would empty both variables. See
`home/.stow-local-ignore` for the steps that complete it.

## Homebrew

```sh
brew bundle --file=Brewfile          # install everything
brew bundle check --file=Brewfile    # list what is missing
brew bundle dump --force --file=Brewfile   # rewrite from what is installed
```

## Neovim debugging (vimspector)

Copy `home/.vimspector.json` into a project root and rename the configuration.
`stopOnEntry` is on, so `F5` alone stops on the first line.

| Key | Action | Key | Action |
| --- | --- | --- | --- |
| `F5` | Launch or continue | `F9` | Toggle breakpoint |
| `Shift-F5` | Stop | `Shift-F9` | Add a function breakpoint |
| `Ctrl-Shift-F5` | Restart | `F10` | Step over |
| `F6` | Pause | `Ctrl-F10` | Run to cursor |
| `F8` | Go to next breakpoint | `F11` | Step into |
| `Shift-F8` | Go to previous breakpoint | `Shift-F11` | Step out |

The keys come from `g:vimspector_enable_mappings = 'VISUAL_STUDIO'` in
`init.vim`.

Two interpreters are in use, and they are not the same one:

- The adapter runs on `~/.local/share/vimspector/venv`. `install_gadget.py`
  writes that path into `gadgets/macos/.gadgets.json`.
- The program you debug runs on the `python` in the project's
  `.vimspector.json`, which defaults to `./venv/bin/python`. The `create` alias
  builds that venv.

Poetry projects need `poetry env info --path` instead of `./venv`.

## Fonts

Two families look alike. **Hasklig** is the plain font. **Hasklug Nerd Font
Mono** is the patched build with the icon glyphs. Neovim's file icons need the
patched one. Set it in every terminal: Ghostty, Warp, Cursor, Zed and iTerm2.
