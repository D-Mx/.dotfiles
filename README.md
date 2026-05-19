# holman does dotfiles

Your dotfiles are how you personalize your system. These are mine.

I was a little tired of having long alias files and everything strewn about
(which is extremely common on other dotfiles projects, too). That led to this
project being much more topic-centric. I realized I could split a lot of things
up into the main areas I used (Ruby, git, system libraries, and so on), so I
structured the project accordingly.

If you're interested in the philosophy behind why projects like these are
awesome, you might want to [read my post on the
subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/holman/dotfiles/fork), remove what you don't
use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## install

Run this:

```sh
git clone https://github.com/holman/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
script/install
```

`script/bootstrap` symlinks every `*.symlink` file to `~/.<name>` and runs
`bin/dot` to install Homebrew deps. `script/install` then walks every topic's
`install.sh` — these are needed for configs that live in subdirectories
(`~/.config/...`, `~/.cursor/...`, `~/.codex/...`) which the basic symlink
pass can't express.

Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## topics added in this fork

These topics use the per-topic `install.sh` pattern (run via `script/install`)
because their targets live in subdirectories rather than `~/.<name>`:

- `agents/` — unified `~/.agents` folder. Symlinks `~/.agents` -> this dir,
  and `~/.claude/agents` -> `~/.agents` for Claude Code (Cursor/Codex read
  `~/.agents` natively). Drop your shared agent/skill/prompt files here.
- `claude/` — user-scope Claude Code `settings.json`. Project-scope settings
  for this repo live separately under `.dotfiles/.claude/settings.local.json`.
- `codex/` — Codex CLI `config.toml`. Tracks model, approval policy, plugin
  enables. Per-path trust grants, volatile marketplace cache, and TUI nux
  state are stripped (the first two leak machine layout; the third churns).
- `cursor/` — Cursor CLI agent `cli-config.json` (symlinked). Cursor IDE
  GUI `settings.json` and `keybindings.json` are also symlinked from
  `cursor/ide/` into `~/Library/Application Support/Cursor/User/`, so
  edits inside the GUI write straight through to the tracked files.
- `ghostty/` — symlinks the tracked config to `~/.config/ghostty/config`.
- `starship/` — same idea for `~/.config/starship/starship.toml`.
- `asdf/` — `tool-versions.symlink` is auto-linked to `~/.tool-versions` by
  `script/bootstrap` (no install.sh needed; lives at the top level).

`~/.localrc` is intentionally NOT tracked — it's the machine-local escape
hatch sourced by [zsh/zshrc.symlink](zsh/zshrc.symlink) (see the comment
there). Create it by hand on each machine for env vars and secrets.

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rbenv` installed, for example. That
said, I do use this as _my_ dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/holman/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

## thanks

I forked [Ryan Bates](http://github.com/ryanb)' excellent
[dotfiles](http://github.com/ryanb/dotfiles) for a couple years before the
weight of my changes and tweaks inspired me to finally roll my own. But Ryan's
dotfiles were an easy way to get into bash customization, and then to jump ship
to zsh a bit later. A decent amount of the code in these dotfiles stem or are
inspired from Ryan's original project.
