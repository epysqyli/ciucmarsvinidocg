# ViniCiucMars — sito vetrina

Sito statico bilingue (IT/EN) per una piccola cantina della Langhe.
Ospitato su **GitHub Pages**: <https://epysqyli.github.io/ciucmarsvinidocg/>

Tecnologia: Jekyll, senza plugin fuori whitelist GitHub Pages
(unico plugin: `jekyll-sitemap`). Nessun JavaScript.

## ⚠️ Contenuti segnaposto

Nome della cantina, testi, vini, contatti e immagini sono **segnaposto**.
Prima di pubblicare davvero, sostituire:

- [ ] Nome e tagline → `_config.yml` (`title`, `description`) e `footer_tagline` in `_data/it.yml` / `_data/en.yml`
- [ ] Dati di contatto → `_data/contact.yml` (indirizzo, telefono, email, social, link mappa)
- [ ] Vini (nome, annata, uvaggio, descrizione, abbinamento) → chiave `wines` in `_data/it.yml` e `_data/en.yml`
- [ ] Testi delle pagine → `_pages/it/*.html` e `_pages/en/*.html`
- [ ] Foto → `assets/img/` (vedi sotto)

## Immagini

Le immagini attuali sono illustrazioni SVG segnaposto. Per usare foto vere:
salvare il file in `assets/img/` e aggiornare il riferimento
(`_pages/…` per le immagini di pagina, `_data/…` per le foto dei vini).

| File | Usato per |
|---|---|
| `hero-home.svg` | home (hero), pagina storia |
| `story.svg` | home (cantina), pagina storia |
| `vineyards.svg` | home (vigneti), pagina vigneti |
| `bottles-row.svg` | intestazione pagina vini |
| `cellar-door.svg` | intestazione pagina contatti |
| `wine-*.svg` | schede dei vini (home + pagina vini) |

### Logo

Il logo è la foglia di vite vettoriale ricavata dal disegno originale
(`image-suggestions/logo-empty.jpeg`). La geometria di riferimento vive in
`_includes/leaf-mark.html`: testata e footer la includono inline, così il
colore segue il contesto (`currentColor`), e anche `assets/favicon.svg` la
riusa. Le nervature sono ricavate con una maschera, quindi mostrano lo sfondo.

`_includes/leaf-mark.html` viene compilato da Jekyll: da solo non è un SVG
valido e non si può aprire in anteprima. `assets/img/logo-leaf.svg` è invece
un SVG statico, identico graficamente, apribile direttamente (anteprima,
programmi di grafica, ecc.). Tenere allineati i due file.

## Struttura

```
_config.yml          configurazione sito (titolo, URL base, lingue)
_data/it.yml         stringhe IT: menu, etichette, lista vini
_data/en.yml         stringhe EN: menu, etichette, lista vini
_data/contact.yml    dati di contatto (indipendenti dalla lingua)
_layouts/default.html  layout unico (head, meta, header, footer)
_includes/           header, footer, switch lingua, scheda vino, ecc.
_pages/it/           pagine in italiano  → /, /storia/, /vini/, /vigneti/, /contatti/
_pages/en/           pagine in inglese   → /en/, /en/story/, /en/wines/, …
assets/              CSS, favicon, immagini
404.html             pagina non trovata (bilingue)
robots.txt, sitemap  generato da jekyll-sitemap
```

## Come funziona il bilinguismo

Ogni pagina ha nel front matter `lang` (`it`/`en`) e `ref` (stesso valore per
la pagina italiana e quella inglese corrispondente). Lo switch IT/EN in
testata usa `ref` per saltare alla pagina equivalse nell'altra lingua.
L'italiano è sulla radice `/`, l'inglese sotto `/en/`.

## Anteprima locale

```sh
./serve.sh                 # → http://localhost:4000
./serve.sh --livereload    # ricarica automatica del browser
```

Lo script trova Jekyll anche se installato come gem utente (rbenv).
Senza lo script:

```sh
jekyll serve --baseurl ""   # → http://localhost:4000
```

Senza `--baseurl ""` il server rispecchia GitHub Pages:
<http://localhost:4000/ciucmarsvinidocg/>

## Pubblicazione

Il sito è pubblicato automaticamente da GitHub Pages a ogni push su `main`
(Settings → Pages → *Deploy from a branch* → `main` / root).
