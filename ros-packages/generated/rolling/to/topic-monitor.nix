{
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "topic_monitor";
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."topic_monitor";
  propagatedBuildInputs = [ launch launch-ros rclpy std-msgs ];
  checkInputs = [ ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "topic_monitor" = substituteSource {
      src = fetchgit {
        name = "topic_monitor-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "7d8c34d336e8da4ba4c9a9075914720a2c12a145";
        hash = "sha256-p7YlFe0fKgrT31/IfEXTScnhr6FltowF1qR91eBlrqM=";
      };
    };
  });
  meta = {
    description = "Package containing tools for monitoring ROS 2 topics.";
  };
})
