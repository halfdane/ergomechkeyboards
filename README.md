# Split-Ergo-Tastaturen — PowerPoint-Karaoke Deck

Eine kurze, spaßige Präsentation (auf Deutsch) über geteilte, ergonomische
Tastaturen — als [reveal.js](https://revealjs.com/)-Deck, geschrieben in
Markdown und gerendert mit [`reveal-md`](https://github.com/webpro/reveal-md).

Die ganze Folien-„Story" steckt in den Sprecher-Notizen, damit auch jemand ohne
Vorwissen die Präsentation halten kann.

## Schnellstart

Voraussetzungen: [Nix](https://nixos.org/) (mit Flakes) und optional
[direnv](https://direnv.net/).

```fish
# Umgebung aktivieren (direnv)
direnv allow

# ... oder manuell ohne direnv:
nix develop

# Deck mit Live-Reload starten → http://localhost:1948
reveal-md slides.md -w
```

Alternativ direkt über das Flake-App:

```fish
nix run
```

## Präsentieren

- Pfeile / Leertaste blättern durch die Folien.
- **S** öffnet die Sprecher-Ansicht (Speaker View) mit den Notizen und Timer.
- **F** Vollbild, **ESC** Übersicht.

## Drucken / PDF (online)

`reveal-md` druckt per Browser. Im Browser an die URL `?print-pdf` anhängen und
über den **Druckdialog des Browsers** als PDF speichern, z. B.:

```
http://localhost:1948/slides.md?print-pdf
```

(Offline-PDF-Export via Chromium ist bewusst nicht eingerichtet.)

## Statischer Export

Eigenständige HTML-Seite inkl. Assets erzeugen:

```fish
reveal-md slides.md --static _site --static-dirs=assets,css
```

## Struktur

| Pfad | Zweck |
| --- | --- |
| `slides.md` | Die Folien (Markdown, `---` trennt Folien, `Note:` = Sprecher-Notiz) |
| `assets/*.svg` | Selbst gezeichnete Diagramme (Haltung, Matrix, Fingerwege …) |
| `assets/photos/` | Echte Fotos (Switches, traditionelle &amp; Split-Tastatur) |
| `css/custom.css` | Dunkles Solarized-Skin + verspielte Akzente |
| `reveal-md.json` | `reveal-md`-Optionen (Theme, Separatoren, CSS) |
| `reveal.json` | reveal.js-Optionen (Transition, Foliennummern …) |
| `flake.nix` / `.envrc` | Reproduzierbare Dev-Umgebung mit `reveal-md` |

## Anpassen

- Theme ist dunkles **Solarized** (`css/custom.css`). Farben sind als
  CSS-Variablen oben in der Datei definiert — einfach dort drehen.
- Neue Folie: zwei Leerzeilen, dann `---`, dann der Inhalt.
- Bilder: relative Pfade zu `assets/...` verwenden.
