# CLAUDE.md

This repo is a capture space for home lab / dev server ideas. It holds notes,
not application code.

## Conventions

- `inbox.md` — raw capture, one bullet per item, appended to the bottom of the
  `## Links` list. Items are ticked off when promoted to `ideas/` or dropped,
  with a note saying which, and ticked lines get deleted once they're stale.
- `ideas/<kebab-case-title>.md` — one file per idea, created from
  `templates/idea.md` (or via `./scripts/new-idea.sh "Title"`). Front matter
  carries `title`, `status`, `created`, `updated`, `tags`.
- `status` values: `idea`, `researching`, `ready`, `building`, `running`,
  `parked`, `dropped`.
- `stack.md` — what is currently deployed. An idea reaching `running` gets a
  row here.
- Build logs live at the bottom of the idea's own file, newest entry last, in
  the format described in `templates/build-log.md`.

## Working in here

- Update `updated:` in front matter whenever you change an idea file.
- Never delete a `parked` or `dropped` idea — the recorded reason is the point.
- Check `stack.md` before proposing a new service: ports, hosts, and existing
  dependencies matter more than the idea in isolation.
- Prefer concrete specifics over generic advice. "Runs on the N100 box next to
  Jellyfin, needs 40GB on the NVMe" is useful; "consider your storage needs"
  is not.
- Keep markdown wrapped at roughly 80 columns.
