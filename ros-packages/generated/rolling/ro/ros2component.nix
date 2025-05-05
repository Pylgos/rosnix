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
  version = "0.39.0-1";
  src = finalAttrs.passthru.sources."ros2component";
  propagatedNativeBuildInputs = [ ament-index-python composition-interfaces rcl-interfaces rclcpp-components rclpy ros2cli ros2node ros2param ros2pkg ];
  propagatedBuildInputs = [ ament-index-python composition-interfaces rcl-interfaces rclcpp-components rclpy ros2cli ros2node ros2param ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2component" = substituteSource {
      src = fetchgit {
        name = "ros2component-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "ffa9a95b6322ab6027a4b82315c0dbb9f8d14ff6";
        hash = "sha256-dzXeIZYthmAAr5FuZZSXVWYcHLAbGQAO1KF0TOHzMzk=";
      };
    };
  });
  meta = {
    description = "\n    The component command for ROS 2 command line tools.\n  ";
  };
})
