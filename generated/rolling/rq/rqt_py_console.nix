{
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  qt_gui,
  qt_gui_py_common,
  rclpy,
  rosSystemPackages,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_py_console-b0285539089d740a61f76e07cbf772f16c2b862f = substituteSource {
      src = fetchgit {
        name = "rqt_py_console-b0285539089d740a61f76e07cbf772f16c2b862f-source";
        url = "https://github.com/ros2-gbp/rqt_py_console-release.git";
        rev = "b0285539089d740a61f76e07cbf772f16c2b862f";
        hash = "sha256-ytSOPsH9+KZ4L4EF+TiyIeHsmfFwIKsRO9KYcOILl/k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_py_console";
  version = "1.3.0-1";
  src = sources.rqt_py_console-b0285539089d740a61f76e07cbf772f16c2b862f;
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python python_qt_binding qt_gui qt_gui_py_common rclpy rqt_gui rqt_gui_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "rqt_py_console is a Python GUI plugin providing an interactive Python console.";
  };
}
