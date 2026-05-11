{
  ament-copyright,
  ament-flake8,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rclpy,
  ros2topic,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_topic";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."rqt_topic";
  propagatedNativeBuildInputs = [ python-qt-binding rclpy ros2topic rqt-gui rqt-gui-py rqt-py-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pydantic" ]; };
  propagatedBuildInputs = [ python-qt-binding rclpy ros2topic rqt-gui rqt-gui-py rqt-py-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydantic" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_topic" = substituteSource {
      src = fetchgit {
        name = "rqt_topic-source";
        url = "https://github.com/ros2-gbp/rqt_topic-release.git";
        rev = "02f2d039bc8aaa31826e7d0eb1294218a2d1d977";
        hash = "sha256-GBvDG35m2zGwLWPTpvM1DaPToONcKGcZvX18khyQA5g=";
      };
    };
  });
  meta = {
    description = "rqt_topic provides a GUI plugin for displaying debug information about ROS topics including publishers, subscribers, publishing rate, and ROS Messages.";
  };
})
