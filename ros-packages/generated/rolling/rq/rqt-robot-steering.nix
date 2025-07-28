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
  version = "4.0.0-1";
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
        rev = "2f4009489d99898857a80b61652c61a8638c4c7d";
        hash = "sha256-pzMtrkECZAmwIEbE9f3xsI1qRHVnmLYzF33oSNWgFYI=";
      };
    };
  });
  meta = {
    description = "rqt_robot_steering provides a GUI plugin for steering a robot using Twist messages.";
  };
})
