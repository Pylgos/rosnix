{
  lib,
  pkgs,
  selfLegacyPackages,
}:

rec {
  distros = lib.mapAttrs (
    _distro_name: pkgs: lib.filterAttrs (_name: value: lib.isDerivation value) pkgs.rosPackages
  ) (lib.removeAttrs selfLegacyPackages [ "default" ]);

  all = lib.mapAttrs (
    distro: rosPkgs:
    pkgs.stdenv.mkDerivation {
      name = "rosnix-ci-${distro}-all-pkgs";
      deps = lib.attrValues rosPkgs;
      phases = [ "installPhase" ];
      installPhase = "touch $out";
    }
  ) distros;

  check = lib.mapAttrs (
    distro: rosPkgs:
    pkgs.stdenv.mkDerivation {
      name = "rosnix-ci-${distro}-check-pkgs";
      deps = [
        rosPkgs.desktop
        rosPkgs.cartographer
        (rosPkgs.slam-toolbox or null)
        rosPkgs.navigation2
        rosPkgs.ros-gz
        rosPkgs.librealsense2
      ];
      phases = [ "installPhase" ];
      installPhase = "touch $out";
    }
  ) distros;
}
