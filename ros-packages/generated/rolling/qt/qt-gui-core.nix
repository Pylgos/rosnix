{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "qt_gui_core" = substituteSource {
      src = fetchgit {
        name = "qt_gui_core-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "45761a697c77cffb8bebd429e8aec9f6ef9d6b5a";
        hash = "sha256-TBKwDKOBaAGAGHYYU+OcMXUisCTfGKdIdjYBj33JlDM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "qt_gui_core";
  version = "2.8.2-1";
  src = sources."qt_gui_core";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Integration of the ROS package system and ROS-specific plugins for a Qt-based GUI.";
  };
}
