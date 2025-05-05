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
  version = "0.0.16-7";
  src = finalAttrs.passthru.sources."grbl_ros";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ grbl-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-serial" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "grbl_ros" = substituteSource {
      src = fetchgit {
        name = "grbl_ros-source";
        url = "https://github.com/ros2-gbp/grbl_ros-release.git";
        rev = "5799fb212d9171d9944488a5c871f2574b7d5ffb";
        hash = "sha256-F1t2vcBH6JU+xByKp5lu3SCks+qWKp4ztQ5WkL6N+rI=";
      };
    };
  });
  meta = {
    description = "ROS2 package to interface with a GRBL serial device";
  };
})
