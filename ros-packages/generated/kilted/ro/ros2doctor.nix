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
  ros2cli,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2doctor";
  version = "0.38.0-1";
  src = finalAttrs.passthru.sources."ros2doctor";
  propagatedNativeBuildInputs = [ ament-index-python rclpy ros2cli ros-environment std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" "python3-importlib-metadata" "python3-psutil" "python3-rosdistro-modules" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli ros-environment std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg-modules" "python3-importlib-metadata" "python3-psutil" "python3-rosdistro-modules" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2doctor" = substituteSource {
      src = fetchgit {
        name = "ros2doctor-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "9cf605540cb9cf580d4bc1b0be029f12d55d8ea8";
        hash = "sha256-4NFe336Jui3sKaKdM9pDbUfPgEnE9+qS/npQOoOWLFA=";
      };
    };
  });
  meta = {
    description = "A command line tool to check potential issues in a ROS 2 system";
  };
})
