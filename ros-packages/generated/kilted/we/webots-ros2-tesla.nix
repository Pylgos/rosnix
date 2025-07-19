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
  version = "2025.0.1-1";
  src = finalAttrs.passthru.sources."webots_ros2_tesla";
  propagatedNativeBuildInputs = [ ackermann-msgs builtin-interfaces rclpy webots-ros2-driver ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-opencv" ]; };
  propagatedBuildInputs = [ ackermann-msgs builtin-interfaces rclpy webots-ros2-driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-opencv" ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_tesla" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_tesla-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "ce7832742984b8447b999aa1cd32ff24c39b3181";
        hash = "sha256-Y6EZTYE5isC2js1ALARj0/oAgIgC7cvxRWIAaJLJBnk=";
      };
    };
  });
  meta = {
    description = "Tesla ROS2 interface for Webots.";
  };
})
