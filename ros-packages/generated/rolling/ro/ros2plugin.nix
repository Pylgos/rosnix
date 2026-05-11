{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  ros2cli,
  ros2pkg,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2plugin";
  version = "6.0.0-1";
  src = finalAttrs.passthru.sources."ros2plugin";
  propagatedNativeBuildInputs = [ ament-index-python rclpy ros2cli ros2pkg ];
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2plugin" = substituteSource {
      src = fetchgit {
        name = "ros2plugin-source";
        url = "https://github.com/ros2-gbp/pluginlib-release.git";
        rev = "b1bf3f24adabe82861c9f858dc6d2f0bb62b22c5";
        hash = "sha256-aNBmLzYHHv6n7DZ7dG0S1sD+U49ZxqhD2nBPa3npA2E=";
      };
    };
  });
  meta = {
    description = "\n    The plugin command for ROS 2 command line tools.\n  ";
  };
})
