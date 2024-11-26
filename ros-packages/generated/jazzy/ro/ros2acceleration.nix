{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  ros2cli,
  rosSystemPackages,
  rosidl-runtime-py,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2acceleration";
  version = "0.5.1-4";
  src = finalAttrs.passthru.sources."ros2acceleration";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-yaml" ]; };
  propagatedBuildInputs = [ rclpy ros2cli rosidl-runtime-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2acceleration" = substituteSource {
        src = fetchgit {
          name = "ros2acceleration-source";
          url = "https://github.com/ros2-gbp/ros2acceleration-release.git";
          rev = "18eede7c818416a07f43314c8a39b6c7abc5b03e";
          hash = "sha256-DRkaUv6JAKKbX1+DqnpK8wTDm1+jlEoHal/0i6rhA6I=";
        };
      };
    });
  };
  meta = {
    description = "The acceleration command for ROS 2 command line tools.";
  };
})
