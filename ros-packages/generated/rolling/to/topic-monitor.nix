{
  ament-flake8,
  ament-mypy,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  example-interfaces,
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
  version = "0.38.0-1";
  src = finalAttrs.passthru.sources."topic_monitor";
  propagatedNativeBuildInputs = [ example-interfaces launch launch-ros rclpy std-msgs ];
  propagatedBuildInputs = [ example-interfaces launch launch-ros rclpy std-msgs ];
  checkInputs = [ ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "topic_monitor" = substituteSource {
      src = fetchgit {
        name = "topic_monitor-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "d99ec448c761d4902174db0346e001769838d72e";
        hash = "sha256-qfBXhAuW2SVOj0xwdYcOMZIN8nG/OW4sHlZ3eJiY1cU=";
      };
    };
  });
  meta = {
    description = "Package containing tools for monitoring ROS 2 topics.";
  };
})
