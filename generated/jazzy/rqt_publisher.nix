{
  ament_index_python,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt_gui_py_common,
  rclpy,
  rosidl_runtime_py,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_publisher = substituteSource {
      src = fetchgit {
        name = "rqt_publisher-source";
        url = "https://github.com/ros2-gbp/rqt_publisher-release.git";
        rev = "cb589e728965b6994e4ecc79b7bcddf738531acf";
        hash = "sha256-TFsWLYSUlJfO+cj2md0qhAlWz//ATUWUdHtqV4UBbBg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_publisher";
  version = "1.7.2-2";
  src = sources.rqt_publisher;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python python_qt_binding qt_gui_py_common rclpy rosidl_runtime_py rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_publisher provides a GUI plugin for publishing arbitrary messages with fixed or computed field values.";
  };
}
