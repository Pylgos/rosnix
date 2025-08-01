#!/usr/bin/env bash

set -e
set -o pipefail

distributions=($(ls ros-packages/generated))

for distro in "${distributions[@]}"; do
  rosPackages="(import ./default.nix).outputs.legacyPackages.x86_64-linux.$distro.rosPackages"
  pkgNames=(
    zenoh-cpp-vendor
  )
  for pkgName in "${pkgNames[@]}"; do
    attr="$rosPackages.$pkgName.cargoDeps.vendorStaging"
    hash=$(nurl -e "$attr")
    echo "hash of $attr: $hash"
    mkdir -p "ros-packages/overrides/$distro/cargo-hashes"
    printf '# Generated by update.bash\n"%s"\n' "$hash" > "ros-packages/overrides/$distro/cargo-hashes/$pkgName.nix"
  done
done
