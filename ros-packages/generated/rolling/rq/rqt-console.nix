{
  ament-index-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rcl-interfaces,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_console";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."rqt_console";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding rcl-interfaces rclpy rqt-gui rqt-gui-py rqt-py-common ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_console" = substituteSource {
      src = fetchgit {
        name = "rqt_console-source";
        url = "https://github.com/ros2-gbp/rqt_console-release.git";
        rev = "7687bc5a9cc8ac81046ef38b3a8258f5dcc7057f";
        hash = "sha256-rF3jOEKJh1Dxf55KPt0uAahS9Tsrze7kdEnUyVnwylE=";
      };
    };
  });
  meta = {
    description = "rqt_console provides a GUI plugin for displaying and filtering ROS messages.";
  };
})
