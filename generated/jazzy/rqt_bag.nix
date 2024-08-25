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
        rev = "fc6116adc9db168a71892ec9eb8c83105363e27f";
        hash = "sha256-K+pDQ5wUSt1qrw0P87qv4my3psSCvJKlgSXdwmMuw1A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_bag";
  version = "1.5.3-1";
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
