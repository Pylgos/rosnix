{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  qt5,
  qt_gui_cpp,
  rclcpp,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_gui_cpp = substituteSource {
      src = fetchgit {
        name = "rqt_gui_cpp-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "203afbe889f0dfc658d26e0dd5d6a920c99650c2";
        hash = "sha256-yi1UAUukfirWnfD6X30N8am0kQstky8Q6ttu2LeWBqo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gui_cpp";
  version = "1.7.2-1";
  src = sources.rqt_gui_cpp;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib qt5.qtbase qt_gui_cpp rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_gui_cpp enables GUI plugins to use the C++ client library for ROS.";
  };
}
