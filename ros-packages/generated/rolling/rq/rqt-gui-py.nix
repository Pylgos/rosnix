{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_gui_py";
  version = "1.10.1-1";
  src = finalAttrs.passthru.sources."rqt_gui_py";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ python-qt-binding qt-gui rclpy rqt-gui ];
  propagatedBuildInputs = [ python-qt-binding qt-gui rclpy rqt-gui ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_gui_py" = substituteSource {
      src = fetchgit {
        name = "rqt_gui_py-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "e6637b73bca45ea898187c4fedf73bb21f97ae48";
        hash = "sha256-G2VXxcXY1fgYWT9gFnGOd1i4RQOXIq/jkXVR0rFZ0LA=";
      };
    };
  });
  meta = {
    description = "rqt_gui_py enables GUI plugins to use the Python client library for ROS.";
  };
})
