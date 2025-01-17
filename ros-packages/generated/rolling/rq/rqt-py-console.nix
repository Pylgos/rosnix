{
  ament-index-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui,
  qt-gui-py-common,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_py_console";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."rqt_py_console";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-gui qt-gui-py-common rclpy rqt-gui rqt-gui-py ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_py_console" = substituteSource {
      src = fetchgit {
        name = "rqt_py_console-source";
        url = "https://github.com/ros2-gbp/rqt_py_console-release.git";
        rev = "b0285539089d740a61f76e07cbf772f16c2b862f";
        hash = "sha256-ytSOPsH9+KZ4L4EF+TiyIeHsmfFwIKsRO9KYcOILl/k=";
      };
    };
  });
  meta = {
    description = "rqt_py_console is a Python GUI plugin providing an interactive Python console.";
  };
})
