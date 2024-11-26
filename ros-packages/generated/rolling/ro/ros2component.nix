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
  version = "0.36.0-1";
  src = finalAttrs.passthru.sources."ros2component";
  propagatedBuildInputs = [ ament-index-python composition-interfaces rcl-interfaces rclcpp-components rclpy ros2cli ros2node ros2param ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2component" = substituteSource {
        src = fetchgit {
          name = "ros2component-source";
          url = "https://github.com/ros2-gbp/ros2cli-release.git";
          rev = "be08b778e30b21272d045b41823482cc387d92e5";
          hash = "sha256-X4B6ps7bsGphgX7AlCUDxXzF134offee5VyxsUb2Z2g=";
        };
      };
    });
  };
  meta = {
    description = "The component command for ROS 2 command line tools.";
  };
})
