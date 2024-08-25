{
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  qt_gui,
  rclpy,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_gui = substituteSource {
      src = fetchgit {
        name = "rqt_gui-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "8eec9c6a8d6951524a0d1fe98f9640ef8ef40267";
        hash = "sha256-nY0zbmJ/xPK7ZekKh0ONOV+us66g03mWsFQeC42Wx7Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gui";
  version = "1.6.0-2";
  src = sources.rqt_gui;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python python_qt_binding qt_gui rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_gui provides the main to start an instance of the ROS integrated graphical user interface provided by qt_gui.";
  };
}
