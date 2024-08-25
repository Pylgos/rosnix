{
  ament_copyright,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  rclpy,
  rosbag2_py,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_bag = substituteSource {
      src = fetchgit {
        name = "rqt_bag-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "b3c31562712bfce3526e9db62ba090054e58f362";
        hash = "sha256-kJjrPkyylgQ3NBFlfVMHxeqQMne+kJhN82mcT0ql64Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_bag";
  version = "2.0.0-1";
  src = sources.rqt_bag;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rclpy rosbag2_py rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_bag provides a GUI plugin for displaying and replaying ROS bag files.";
  };
}
