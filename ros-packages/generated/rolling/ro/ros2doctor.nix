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
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rclpy,
  ros-environment,
  ros2action,
  ros2cli,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2doctor";
  version = "0.41.0-1";
  src = finalAttrs.passthru.sources."ros2doctor";
  propagatedNativeBuildInputs = [ ament-index-python rclpy ros2action ros2cli ros-environment std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" "python3-psutil" "python3-rosdistro-modules" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy ros2action ros2cli ros-environment std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg-modules" "python3-psutil" "python3-rosdistro-modules" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros std-msgs std-srvs test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2doctor" = substituteSource {
      src = fetchgit {
        name = "ros2doctor-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "72acad3cc652964f7040354e4f7706dd8d8f86de";
        hash = "sha256-3NJCfyfviBTOpndsJHXd9CcS6fibvJkc2JAFRVWJg7Q=";
      };
    };
  });
  meta = {
    description = "A command line tool to check potential issues in a ROS 2 system";
  };
})
