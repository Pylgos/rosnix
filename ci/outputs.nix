{
  lib,
  pkgs,
  selfLegacyPackages,
}:

let
  nixpkgsInstances = lib.removeAttrs selfLegacyPackages [ "default" ];
in
rec {
  all = lib.mapAttrs (
    distro: pkgs:
    let
      rosPkgs = lib.filterAttrs (_name: value: lib.isDerivation value) pkgs;
    in
    pkgs.stdenv.mkDerivation {
      name = "rosnix-ci-${distro}-all-pkgs";
      deps = lib.attrValues rosPkgs;
      phases = [ "installPhase" ];
      installPhase = "touch $out";
    }
  ) nixpkgsInstances;

  check = lib.mapAttrs (
    distro: pkgs:
    let
      tests = import ../tests {
        inherit lib pkgs;
      };
      rosPkgs = pkgs.rosPackages;
    in
    pkgs.stdenv.mkDerivation {
      name = "rosnix-ci-${distro}-check-pkgs";
      deps = [
        rosPkgs.desktop
        rosPkgs.cartographer
        (rosPkgs.slam-toolbox or null)
        rosPkgs.navigation2
        rosPkgs.nav2-bringup
        rosPkgs.ros-gz
        rosPkgs.librealsense2
        pkgs.webots
        rosPkgs.webots-ros2
      ] ++ lib.attrValues tests;
      phases = [ "installPhase" ];
      installPhase = "touch $out";
    }
  ) nixpkgsInstances;
}
