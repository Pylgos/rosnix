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
  version = "0.37.4-1";
  src = finalAttrs.passthru.sources."topic_monitor";
  propagatedNativeBuildInputs = [ launch launch-ros rclpy std-msgs ];
  propagatedBuildInputs = [ launch launch-ros rclpy std-msgs ];
  checkInputs = [ ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "topic_monitor" = substituteSource {
      src = fetchgit {
        name = "topic_monitor-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "96bd225a0fae6d983bc2faae9bdd410ef19820e8";
        hash = "sha256-oxeDZW/yJecnHLrmRCAMyHBcfVcbTscPGZiIz5pMAm4=";
      };
    };
  });
  meta = {
    description = "Package containing tools for monitoring ROS 2 topics.";
  };
})
