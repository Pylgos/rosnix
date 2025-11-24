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
  version = "0.40.2-1";
  src = finalAttrs.passthru.sources."ros2component";
  propagatedNativeBuildInputs = [ ament-index-python composition-interfaces rcl-interfaces rclcpp-components rclpy ros2cli ros2node ros2param ros2pkg ];
  propagatedBuildInputs = [ ament-index-python composition-interfaces rcl-interfaces rclcpp-components rclpy ros2cli ros2node ros2param ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2component" = substituteSource {
      src = fetchgit {
        name = "ros2component-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "984d76fa1e699746cdc9a3849864662335d70561";
        hash = "sha256-gigzRGFrCXVJvv+gubtyqH3creosvCkQJuDtKZD5rvk=";
      };
    };
  });
  meta = {
    description = "\n    The component command for ROS 2 command line tools.\n  ";
  };
})
