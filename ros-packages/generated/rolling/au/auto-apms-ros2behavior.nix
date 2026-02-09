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
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."auto_apms_ros2behavior";
  propagatedNativeBuildInputs = [ ament-index-python auto-apms-behavior-tree auto-apms-interfaces rcl-interfaces rclpy ros2cli ros2param ros2run std-srvs ];
  propagatedBuildInputs = [ ament-index-python auto-apms-behavior-tree auto-apms-interfaces rcl-interfaces rclpy ros2cli ros2param ros2run std-srvs ];
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "auto_apms_ros2behavior" = substituteSource {
      src = fetchgit {
        name = "auto_apms_ros2behavior-source";
        url = "https://github.com/ros2-gbp/autoapms-release.git";
        rev = "e413995e2fbf559978ef11ff2194a9a9e791a50a";
        hash = "sha256-vLm1vkuPCzzUjLzUXP2QFhIpmbk7b3DKZnLWyu8yONo=";
      };
    };
  });
  meta = {
    description = "AutoAPMS related extensions for the ROS 2 CLI introducing the ros2 behavior command";
  };
})
