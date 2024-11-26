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
  version = "1.0.0-5";
  src = finalAttrs.passthru.sources."rqt_robot_steering";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-python geometry-msgs python-qt-binding rclpy rqt-gui rqt-gui-py ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_robot_steering" = substituteSource {
      src = fetchgit {
        name = "rqt_robot_steering-source";
        url = "https://github.com/ros2-gbp/rqt_robot_steering-release.git";
        rev = "23aabcc88d8b6f2ec7260073b80eaf8bb5d51d24";
        hash = "sha256-GQCdfFYxE/yR3Eostcf+T9VKwP2N45EzidAhXz5uVrw=";
      };
    };
  });
  meta = {
    description = "rqt_robot_steering provides a GUI plugin for steering a robot using Twist messages.";
  };
})
