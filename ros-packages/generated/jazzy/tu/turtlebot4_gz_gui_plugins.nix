{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_gui_vendor,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_gz_gui_plugins-76b65c1cbeef9b611b2dc132642aa3d5579bf816 = substituteSource {
      src = fetchgit {
        name = "turtlebot4_gz_gui_plugins-76b65c1cbeef9b611b2dc132642aa3d5579bf816-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "76b65c1cbeef9b611b2dc132642aa3d5579bf816";
        hash = "sha256-diJhkfZQeAyXVe34WePyUNEVsnqrcllwQ/hNmH0fje8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_gz_gui_plugins";
  version = "2.0.1-1";
  src = sources.turtlebot4_gz_gui_plugins-76b65c1cbeef9b611b2dc132642aa3d5579bf816;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_gui_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qml-module-qtquick-extras" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Turtlebot4 Gazebo Simulator GUI Plugins";
  };
}
