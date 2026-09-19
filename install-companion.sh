#!/usr/bin/env bash
# Tablet Toggle - companion-package installer.
#
# Marketplace disclosure: this is an installer/setup path that obtains code
# from the companion `tablet-kbd` repository and then executes its installer.
# The checkout is pinned to a full commit SHA with a detached checkout, so
# the marketplace's static security baseline reports the `installer` and
# `remote-build` review capabilities rather than an unpinned-execution
# finding. The clone target is an unpredictable, user-owned `mktemp -d`
# directory; nothing is written to a predictable shared path.
set -euo pipefail

d="$(mktemp -d)"
trap 'rm -rf "$d"' EXIT

git clone --quiet https://github.com/ngek202/tablet-kbd.git "$d" \
  && git -C "$d" checkout --quiet --detach a9a8a9caead8f5bf125427a551efe97feaef61d4 \
  && "$d/install.sh"
