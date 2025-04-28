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
  version = "0.37.0-1";
  src = finalAttrs.passthru.sources."topic_monitor";
  propagatedBuildInputs = [ launch launch-ros rclpy std-msgs ];
  checkInputs = [ ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "topic_monitor" = substituteSource {
      src = fetchgit {
        name = "topic_monitor-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "b02b222275fa2ff53346c6c8f0e73b3ce245f5a6";
        hash = "sha256-ejt6ohdOlpO1E1rFELb6FHY96wL7gNDgkrWjP7YbPJE=";
      };
    };
  });
  meta = {
    description = "Package containing tools for monitoring ROS 2 topics.";
  };
})
