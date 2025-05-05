{
  ackermann-msgs,
  ament-copyright,
  buildAmentPythonPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  webots-ros2-driver,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2_tesla";
  version = "2025.0.0-1";
  src = finalAttrs.passthru.sources."webots_ros2_tesla";
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ ackermann-msgs builtin-interfaces webots-ros2-driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-opencv" ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_tesla" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_tesla-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "56e1af64e8852a9591f51728bf8269750d9fe41c";
        hash = "sha256-d7ViiwsbvVRzu8c3hE5aqZDy41IDHt03I7WBKTxBBfU=";
      };
    };
  });
  meta = {
    description = "Tesla ROS2 interface for Webots.";
  };
})
