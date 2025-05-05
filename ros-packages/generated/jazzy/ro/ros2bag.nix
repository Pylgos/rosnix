{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
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
  version = "0.26.7-1";
  src = finalAttrs.passthru.sources."ros2bag";
  propagatedNativeBuildInputs = [ ament-index-python rclpy ros2cli rosbag2-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli rosbag2-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch-testing launch-testing-ros rosbag2-storage-default-plugins rosbag2-test-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2bag" = substituteSource {
      src = fetchgit {
        name = "ros2bag-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "6b467cab2af74b2dbd6893a98641010e36dbdde3";
        hash = "sha256-wvF3sczjDVMr/kg2KY2pLcCBYvH+M+jX7/oCvwZ5zSg=";
      };
    };
  });
  meta = {
    description = "\n    Entry point for rosbag in ROS 2\n  ";
  };
})
