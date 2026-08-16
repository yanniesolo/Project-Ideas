# Project Ideas

Capture space for home lab and dev server ideas: articles worth reading, things
worth building, and notes on what's already running.

Plain markdown, no tooling required. Works from a phone on github.com, from an
editor on the desktop, or from a Claude Code session.

## Layout

| Path | What goes there |
| --- | --- |
| `inbox.md` | Fast capture. Paste a link, add a one-line note, move on. |
| `ideas/` | One file per idea, once it's more than a link. |
| `stack.md` | What's actually running on the lab right now. |
| `templates/` | Starting points for new idea and build-log files. |
| `scripts/new-idea.sh` | Creates a new idea file from the template. |

## Workflow

**Capture** — Something interesting shows up. Append a line to `inbox.md`:

```markdown
- [ ] https://example.com/article — thing I might want to try
```

That's the whole capture step. Don't categorize, don't decide.

**Promote** — When an inbox item is worth actually thinking about, give it its
own file:

```bash
./scripts/new-idea.sh "Immich photo server"
```

That creates `ideas/immich-photo-server.md` from the template. Fill in what you
know, link the article, tick the inbox item off.

**Build** — When you start building, flip the idea's `status` to `building` and
keep a running log at the bottom of its file. When it's live, set `status:
running` and add a row to `stack.md`.

## Status values

Each idea file carries a `status` in its front matter:

- `idea` — captured, not evaluated
- `researching` — reading, comparing options
- `ready` — decided what to build, not started
- `building` — in progress
- `running` — deployed and in use, see `stack.md`
- `parked` — deliberately not doing this (keep the reason)
- `dropped` — no longer interested (keep the reason)

Nothing gets deleted. A parked idea with a reason is more useful than a missing
one — it stops you re-researching the same dead end in six months.

## Using this from Claude Code

On the desktop, clone and start a session in the repo:

```bash
git clone https://github.com/yanniesolo/Project-Ideas.git
cd Project-Ideas
claude
```

`CLAUDE.md` tells Claude the conventions above, so things like "promote the
Immich link from my inbox into an idea" or "what's ready to build that only
needs Docker?" work without re-explaining the setup each time.

Useful openers:

- "Read `inbox.md` and turn anything about monitoring into idea files."
- "What in `ideas/` is `ready` and doesn't conflict with what's in `stack.md`?"
- "I'm setting up Idea X tonight — draft the compose file and start a build log."
