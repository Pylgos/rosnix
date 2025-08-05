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
  version = "0.37.2-1";
  src = finalAttrs.passthru.sources."topic_monitor";
  propagatedNativeBuildInputs = [ launch launch-ros rclpy std-msgs ];
  propagatedBuildInputs = [ launch launch-ros rclpy std-msgs ];
  checkInputs = [ ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "topic_monitor" = substituteSource {
      src = fetchgit {
        name = "topic_monitor-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "eb2b2ae0e1c917fdf99ec1064d9c4c32a32e363b";
        hash = "sha256-DSwaXFFqCZBh1EslIimXhN5yBFzAaOA7XNkeVfDPTvU=";
      };
    };
  });
  meta = {
    description = "Package containing tools for monitoring ROS 2 topics.";
  };
})
