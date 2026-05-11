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
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."examples_rclpy_pointcloud_publisher";
  propagatedNativeBuildInputs = [ rclpy sensor-msgs sensor-msgs-py std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ rclpy sensor-msgs sensor-msgs-py std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_pointcloud_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_pointcloud_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "f0b82495561abadac2ecdf98eea5256694651166";
        hash = "sha256-3p9femm9SGGIWD7riTBxPg7o6cOSqWviFDr78FcBxMc=";
      };
    };
  });
  meta = {
    description = "Example on how to publish a Pointcloud2 message";
  };
})
