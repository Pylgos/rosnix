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
  version = "0.32.3-1";
  src = finalAttrs.passthru.sources."ros2doctor";
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" "python3-importlib-metadata" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-psutil" "python3-rosdistro-modules" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2doctor" = substituteSource {
      src = fetchgit {
        name = "ros2doctor-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "c7969752cdbc6e1a24eb1f839b07df6c576bc167";
        hash = "sha256-HUbbQi4YygCsRG7lHTe4gBm8myAXlgPHygUtiPp8nA0=";
      };
    };
  });
  meta = {
    description = "A command line tool to check potential issues in a ROS 2 system";
  };
})
