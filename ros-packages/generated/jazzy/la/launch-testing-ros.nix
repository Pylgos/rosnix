{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_testing_ros";
  version = "0.26.7-1";
  src = finalAttrs.passthru.sources."launch_testing_ros";
  propagatedBuildInputs = [ ament-index-python launch-ros launch-testing rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_testing_ros" = substituteSource {
      src = fetchgit {
        name = "launch_testing_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "68156327dff15bd4c69f48d5fe32bc2d86b167d8";
        hash = "sha256-qNomo+Oti9MQfyd0sWdTDJxFVXXezai85oC9y4/Cm8Y=";
      };
    };
  });
  meta = {
    description = "A package providing utilities for writing ROS2 enabled launch tests.";
  };
})
