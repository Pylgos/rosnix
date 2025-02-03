{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  composition-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclcpp-components,
  rclpy,
  ros2cli,
  ros2node,
  ros2param,
  ros2pkg,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2component";
  version = "0.37.0-1";
  src = finalAttrs.passthru.sources."ros2component";
  propagatedBuildInputs = [ ament-index-python composition-interfaces rcl-interfaces rclcpp-components rclpy ros2cli ros2node ros2param ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2component" = substituteSource {
      src = fetchgit {
        name = "ros2component-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "7e5b193b9abb0363cf35678dfb9f1c01b4096c53";
        hash = "sha256-BmdmAuJQJqHKZ0fZHjjRq83OSk8Ow7tRYQPIOXlsWk0=";
      };
    };
  });
  meta = {
    description = "The component command for ROS 2 command line tools.";
  };
})
