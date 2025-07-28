{
  ament-index-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  python-qt-binding,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_robot_steering";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."rqt_robot_steering";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python geometry-msgs python-qt-binding rclpy rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ ament-index-python geometry-msgs python-qt-binding rclpy rqt-gui rqt-gui-py ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_robot_steering" = substituteSource {
      src = fetchgit {
        name = "rqt_robot_steering-source";
        url = "https://github.com/ros2-gbp/rqt_robot_steering-release.git";
        rev = "e09131f1d2e0ebcd81f7d44e4b4ec503e55abc98";
        hash = "sha256-Grr7d5J0yS9gcSd7YZ9guCmBUoutwDIbYTZlqoBulwM=";
      };
    };
  });
  meta = {
    description = "rqt_robot_steering provides a GUI plugin for steering a robot using Twist messages.";
  };
})
