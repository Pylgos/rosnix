{
  ament-copyright,
  ament-flake8,
  ament-pep257,
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
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_pointcloud_publisher";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ rclpy sensor-msgs sensor-msgs-py std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_pointcloud_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_pointcloud_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "2d3126625922b57bdf5e07a97d251ce3678a6377";
        hash = "sha256-0coxblLLRw5cUv8P6h3qr0L6z2LaGp5ZC5YN35q2kVg=";
      };
    };
  });
  meta = {
    description = "Example on how to publish a Pointcloud2 message";
  };
})
