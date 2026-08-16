# Ideas

One file per idea. Filename is the kebab-cased title: `immich-photo-server.md`,
`wireguard-remote-access.md`.

Create one with:

```bash
./scripts/new-idea.sh "Immich photo server"
```

or by copying `templates/idea.md` by hand.

Every file starts with front matter carrying `status` (see the README for the
list of values). Keeping it there means you can find everything ready to build
with a single grep:

```bash
grep -l 'status: ready' ideas/*.md
```
