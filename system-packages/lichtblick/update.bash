#!/usr/bin/env bash

set -euo pipefail

nix build .#jazzy.lichtblick.src
yarn-berry-fetcher missing-hashes result/yarn.lock > missing-hashes.json
yarn-berry-fetcher prefetch result/yarn.lock missing-hashes.json > offline-cache-hash.txt
