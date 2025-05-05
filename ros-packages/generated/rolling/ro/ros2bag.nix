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
  version = "0.33.0-1";
  src = finalAttrs.passthru.sources."ros2bag";
  propagatedNativeBuildInputs = [ ament-index-python rclpy ros2cli rosbag2-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli rosbag2-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch-testing launch-testing-ros rosbag2-storage-default-plugins rosbag2-test-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2bag" = substituteSource {
      src = fetchgit {
        name = "ros2bag-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "c735ff372fd91a7319b4f26f4a66070cb76edfd9";
        hash = "sha256-i8k60Zs4Uv/6aaX2BMjkIdC0fTEEdzU2Jz611TPwIEY=";
      };
    };
  });
  meta = {
    description = "\n    Entry point for rosbag in ROS 2\n  ";
  };
})
