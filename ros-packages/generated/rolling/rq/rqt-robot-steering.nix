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
  version = "4.0.2-1";
  src = finalAttrs.passthru.sources."rqt_robot_steering";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python geometry-msgs python-qt-binding rclpy rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ ament-index-python geometry-msgs python-qt-binding rclpy rqt-gui rqt-gui-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_robot_steering" = substituteSource {
      src = fetchgit {
        name = "rqt_robot_steering-source";
        url = "https://github.com/ros2-gbp/rqt_robot_steering-release.git";
        rev = "e9e8f573f61a60caf273edc54fa5badff05e3945";
        hash = "sha256-cuIiImcqqo4XSajiH7chpXInUXmAkwyCbZVkIEPOgxU=";
      };
    };
  });
  meta = {
    description = "rqt_robot_steering provides a GUI plugin for steering a robot using Twist messages.";
  };
})
