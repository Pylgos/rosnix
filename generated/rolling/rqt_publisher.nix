{
  ament_index_python,
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
        rev = "8844b832555fa96de8688659d91992e2180d09e2";
        hash = "sha256-Hr9Qhn2z572Ykp1NChlwggFvx2V4fj8zznV9cKv9gj0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_publisher";
  version = "1.8.0-1";
  src = sources.rqt_publisher;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python python3Packages.numpy python_qt_binding qt_gui_py_common rclpy rosidl_runtime_py rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_publisher provides a GUI plugin for publishing arbitrary messages with fixed or computed field values.";
  };
}
