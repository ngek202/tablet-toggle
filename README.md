# tablet-toggle

Tablet-mode toggle bar-widget for Omarchy — the optional companion to the
[tablet-kbd](https://github.com/ngek202/tablet-kbd) package.

## What it is

A bar-widget (right-side system area) showing tablet-mode state. Left-click
toggles tablet mode; right-click opens a health menu (check / repair via
`tablet-verify.sh`).

## Requires

The **tablet-kbd package** (engine, layouts, tablet wiring, verify script).
Without it the widget dims and says so — it never pretends to work.

> Installer in progress (Phase 4 of tablet-kbd). Until then, the package
> installs from https://github.com/ngek202/tablet-kbd manually.

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
- `HealthMenu.qml` — right-click menu (check / repair in floating terminal)

## Notes

- `SUPER+B` / OSK dispatch is untouched — the button is never the sole
  tablet exit (4-finger edge swipe stays).
- Touch long-press menu was tried and closed as not-viable (inner
  MouseArea grabs unstealable + finger drift on a small slot).
- Validates clean: `omarchy plugin validate .` exits 0.

Extracted from tablet-kbd 2026-09-06 (fire order ACBD, Phase C).
