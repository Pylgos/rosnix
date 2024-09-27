{
  ament_cmake,
  buildRosPackage,
  desktop,
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
    desktop_full-9a6d066f38436dbf567d27520fa647e366169c31 = substituteSource {
      src = fetchgit {
        name = "desktop_full-9a6d066f38436dbf567d27520fa647e366169c31-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "9a6d066f38436dbf567d27520fa647e366169c31";
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
  src = sources.desktop_full-9a6d066f38436dbf567d27520fa647e366169c31;
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
