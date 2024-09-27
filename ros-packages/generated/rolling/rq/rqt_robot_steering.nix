{
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python_qt_binding,
  rclpy,
  rosSystemPackages,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_robot_steering-23aabcc88d8b6f2ec7260073b80eaf8bb5d51d24 = substituteSource {
      src = fetchgit {
        name = "rqt_robot_steering-23aabcc88d8b6f2ec7260073b80eaf8bb5d51d24-source";
        url = "https://github.com/ros2-gbp/rqt_robot_steering-release.git";
        rev = "23aabcc88d8b6f2ec7260073b80eaf8bb5d51d24";
        hash = "sha256-GQCdfFYxE/yR3Eostcf+T9VKwP2N45EzidAhXz5uVrw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_robot_steering";
  version = "1.0.0-5";
  src = sources.rqt_robot_steering-23aabcc88d8b6f2ec7260073b80eaf8bb5d51d24;
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python geometry_msgs python_qt_binding rclpy rqt_gui rqt_gui_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "rqt_robot_steering provides a GUI plugin for steering a robot using Twist messages.";
  };
}
