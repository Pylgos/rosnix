{
  ament_cmake,
  buildRosPackage,
  desktop,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  perception,
  rosSystemPackages,
  ros_gz_sim_demos,
  simulation,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    desktop_full = substituteSource {
      src = fetchFromGitHub {
        name = "desktop_full-source";
        owner = "ros2-gbp";
        repo = "variants-release";
        rev = "3bdd312d71e66a970a9491a2beb2e6ee4a82e417";
        hash = "sha256-Ym/P4L92jCLQbe2hhq+3I5CLtJE59ya1csIFnutZlBE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "desktop_full";
  version = "0.11.0-1";
  src = sources.desktop_full;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ desktop perception ros_gz_sim_demos simulation ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides a 'batteries included' experience to novice users.";
  };
}
