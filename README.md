# tablet-toggle

![Tablet Toggle active in the Omarchy bar](preview.png)

Tablet-mode toggle bar-widget for Omarchy — the optional companion to the
[tablet-kbd](https://github.com/ngek202/tablet-kbd) package.

- **License:** GPL-3.0 (see `LICENSE`)
- **Version:** 0.1.0

## What it is

A bar-widget (right-side system area) showing tablet-mode state. Left-click
toggles tablet mode; right-click runs a visible health check and offers a
repair only if problems are found.

The widget dims and explains when the package is missing — it never
pretends to work.

## Requires

The **tablet-kbd package** (SAM OSK engine, layouts, tablet wiring, verify
script). Install it first:

```bash
git clone https://github.com/ngek202/tablet-kbd.git && ./tablet-kbd/install.sh
```

## Install

```bash
omarchy plugin add https://github.com/ngek202/tablet-toggle.git --enable
```

The platform prompts for the bar slot (recommended: right section).
Non-interactive:

```bash
omarchy plugin enable io.github.ngek202.tablet-toggle --section right
```

## Files

- `manifest.json` — plugin manifest (`bar-widget` kind)
- `BarWidget.qml` — toggle + state polling (`tablet-mode.sh status`, 2s)

## Usage

- **Left-click** — toggles tablet mode (highlighted when active). Entering
  tablet mode turns the internal keyboard and touchpad off, enables
  auto-rotate and the touch cursor, and puts **SAM OSK** one swipe away
  (up from the bottom edge, or 3-finger up anywhere).
- **Right-click** — launches the health check in a floating terminal:
  read-only `tablet-verify.sh` runs first, and a
  **`Press R to repair`** prompt appears **only if problems are found**.
  `R` runs mechanical `--fix` repairs and re-checks; any other key exits
  with no changes.
- **Missing package?** No silent toggle — the widget dims, the tooltip
  explains, and right-click still runs the health check to show exactly
  what is absent.

## Notes

- `SUPER+B` / SAM OSK dispatch is untouched — the button is never the
  sole tablet exit (the 4-finger edge swipe stays).
- A popup health menu was tried and closed as not-viable (popup input was
  unavailable in this shell/input path; right-click direct launch is used).
- Touch long-press menu was tried and closed as not-viable (inner
  MouseArea grabs unstealable + finger drift on a small slot).
- Validates clean: `omarchy plugin validate .` exits 0.
