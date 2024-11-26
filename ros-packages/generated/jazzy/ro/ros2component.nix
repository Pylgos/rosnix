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
  version = "0.32.1-1";
  src = finalAttrs.passthru.sources."ros2component";
  propagatedBuildInputs = [ ament-index-python composition-interfaces rcl-interfaces rclcpp-components rclpy ros2cli ros2node ros2param ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2component" = substituteSource {
      src = fetchgit {
        name = "ros2component-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "4d0984d4989f109d9cd7e15951c6ac1ce6ac8378";
        hash = "sha256-KvDKQqXD6vv76CVNmmcBHWb8l0ktorsRYkGo51se1CE=";
      };
    };
  });
  meta = {
    description = "The component command for ROS 2 command line tools.";
  };
})
