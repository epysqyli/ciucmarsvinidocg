# Project instructions

Rules that apply to any agent working in this repository.

## Git — local only

- **Never push to the remote.** Commits stay on this machine.
- Do not run remote-affecting git commands — `git push` (any form),
  `git remote add/set-url`, deleting branches on `origin` — unless the
  user explicitly asks for it in the current message.
- Committing locally and switching/creating branches locally is always allowed.

## Content — the only place is Diano d'Alba

- **Diano d'Alba must remain the only location mentioned anywhere on the
  site.** Never introduce other towns or wine villages (e.g. La Morra,
  Barolo, Serralunga, Monforte) in copy, metadata, alt text or data files.
- Wine denomination names (e.g. "Barbera d'Alba") and the region/country
  names "Langhe", "Piemonte"/"Piedmont", "Italia"/"Italy" are allowed.

## Project notes

- Static bilingual (IT/EN) Jekyll site for ViniCiucMars, a small winery in
  Diano d'Alba. Hosted on GitHub Pages at
  https://epysqyli.github.io/ciucmarsvinidocg/ — but changes are no longer
  pushed, so preview locally instead.
- Preview: `./serve.sh` → http://localhost:4000
- Build check: `jekyll build --destination /tmp/opencode/site-test`
- Content: `_pages/it/`, `_pages/en/` (per-page copy), `_data/it.yml` /
  `_data/en.yml` (UI strings, nav, wine list), `_data/contact.yml`
  (contact details). Styles: `assets/css/main.scss`. Placeholder images:
  `assets/img/*.svg`.
