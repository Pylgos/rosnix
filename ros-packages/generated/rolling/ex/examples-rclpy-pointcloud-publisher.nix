{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  sensor-msgs-py,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_pointcloud_publisher";
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."examples_rclpy_pointcloud_publisher";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ sensor-msgs sensor-msgs-py std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_pointcloud_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_pointcloud_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "f664ee1bff21888d7ee3dbe4dd36623d991c0a97";
        hash = "sha256-k8Fqwg2zsghrCR1DaDT8IJGoPo+JDclcgYUdIvGrAmM=";
      };
    };
  });
  meta = {
    description = "Example on how to publish a Pointcloud2 message";
  };
})
