{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_py_console";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."rqt_py_console";
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding qt-gui qt-gui-py-common rclpy rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-gui qt-gui-py-common rclpy rqt-gui rqt-gui-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_py_console" = substituteSource {
      src = fetchgit {
        name = "rqt_py_console-source";
        url = "https://github.com/ros2-gbp/rqt_py_console-release.git";
        rev = "50d391f095c03a4e4df27fdc0e31371ec532058c";
        hash = "sha256-KRDBck7PWRg/r2iObVhrlpd6WINTkT2Mreb2bMGtsgY=";
      };
    };
  });
  meta = {
    description = "rqt_py_console is a Python GUI plugin providing an interactive Python console.";
  };
})
