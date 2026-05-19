# agents

Canonical source for shared AI agent / skill / prompt files used across tools.

This directory is symlinked to `~/.agents` by `agents/install.sh`. Tools that
natively support `~/.agents` (Cursor, Codex) pick it up automatically. For
tools that don't (Claude Code), `install.sh` additionally symlinks
`~/.claude/agents` -> `~/.agents`.

Drop subdirectories here as you build them up — for example:

```
agents/
  skills/
    babysit/
    create-hook/
  rules/
  prompts/
```
