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
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rclpy,
  ros2cli,
  rosSystemPackages,
  rosbag2-py,
  rosbag2-storage-default-plugins,
  rosbag2-test-common,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2bag";
  version = "0.31.0-1";
  src = finalAttrs.passthru.sources."ros2bag";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli rosbag2-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch-testing launch-testing-ros rosbag2-storage-default-plugins rosbag2-test-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2bag" = substituteSource {
      src = fetchgit {
        name = "ros2bag-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "db34afcfec3f2453b55a5d82c40215572a7e6217";
        hash = "sha256-BwfyfTkLc8sapofSjEnvyBZ/3jo0Ti6GNuqWQKzMm0E=";
      };
    };
  });
  meta = {
    description = "Entry point for rosbag in ROS 2";
  };
})
