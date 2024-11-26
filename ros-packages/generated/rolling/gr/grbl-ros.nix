{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grbl-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "grbl_ros";
  version = "0.0.16-6";
  src = finalAttrs.passthru.sources."grbl_ros";
  propagatedBuildInputs = [ grbl-msgs rclpy std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-serial" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "grbl_ros" = substituteSource {
        src = fetchgit {
          name = "grbl_ros-source";
          url = "https://github.com/ros2-gbp/grbl_ros-release.git";
          rev = "09d56cf61d98d3674d64af0be2d5a44d4cb0ad65";
          hash = "sha256-F1t2vcBH6JU+xByKp5lu3SCks+qWKp4ztQ5WkL6N+rI=";
        };
      };
    });
  };
  meta = {
    description = "ROS2 package to interface with a GRBL serial device";
  };
})
