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
  version = "2.2.1-3";
  src = finalAttrs.passthru.sources."rqt_console";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding rcl-interfaces rclpy rqt-gui rqt-gui-py rqt-py-common ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_console" = substituteSource {
      src = fetchgit {
        name = "rqt_console-source";
        url = "https://github.com/ros2-gbp/rqt_console-release.git";
        rev = "4e7179b14078dcbeec86ec11008b37b74f5ba133";
        hash = "sha256-nnitj5EX/4GJUalogu9OlEP1Bql0LuzLuCV6Ib+myAo=";
      };
    };
  });
  meta = {
    description = "rqt_console provides a GUI plugin for displaying and filtering ROS messages.";
  };
})
