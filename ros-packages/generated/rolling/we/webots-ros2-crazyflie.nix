{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  tf-transformations,
  webots-ros2-driver,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2_crazyflie";
  version = "2025.0.1-1";
  src = finalAttrs.passthru.sources."webots_ros2_crazyflie";
  propagatedNativeBuildInputs = [ builtin-interfaces rclpy tf-transformations webots-ros2-driver ];
  propagatedBuildInputs = [ builtin-interfaces rclpy tf-transformations webots-ros2-driver ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_crazyflie" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_crazyflie-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "caf071a1c0a78e285b79bd9eae5893a784249e4e";
        hash = "sha256-RmuUxCv6BztMcgBF4m11bhWSPRWK7At7cdyNsn67z3A=";
      };
    };
  });
  meta = {
    description = "ROS2 package for Crazyflie webots simulator";
  };
})
