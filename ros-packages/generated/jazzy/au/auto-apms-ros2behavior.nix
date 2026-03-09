{
  ament-copyright,
  ament-index-python,
  auto-apms-behavior-tree,
  auto-apms-interfaces,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  ros2cli,
  ros2param,
  ros2run,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "auto_apms_ros2behavior";
  version = "1.5.0-1";
  src = finalAttrs.passthru.sources."auto_apms_ros2behavior";
  propagatedNativeBuildInputs = [ ament-index-python auto-apms-behavior-tree auto-apms-interfaces rcl-interfaces rclpy ros2cli ros2param ros2run std-srvs ];
  propagatedBuildInputs = [ ament-index-python auto-apms-behavior-tree auto-apms-interfaces rcl-interfaces rclpy ros2cli ros2param ros2run std-srvs ];
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "auto_apms_ros2behavior" = substituteSource {
      src = fetchgit {
        name = "auto_apms_ros2behavior-source";
        url = "https://github.com/ros2-gbp/autoapms-release.git";
        rev = "81f95bbca2e8fa7918932143d4b7adcf7185bc4a";
        hash = "sha256-5iLFL1Hvr9uOLoCnc4y9Jnm7gZfmVFQCVgU+H5H8vsc=";
      };
    };
  });
  meta = {
    description = "AutoAPMS related extensions for the ROS 2 CLI introducing the ros2 behavior command";
  };
})
