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
  version = "2023.1.3-1";
  src = finalAttrs.passthru.sources."webots_ros2_tesla";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ ackermann-msgs builtin-interfaces rclpy webots-ros2-driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-opencv" ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "webots_ros2_tesla" = substituteSource {
        src = fetchgit {
          name = "webots_ros2_tesla-source";
          url = "https://github.com/ros2-gbp/webots_ros2-release.git";
          rev = "d233344bc73905dd94849ea6965b8fbaccdf5136";
          hash = "sha256-EgiN0ZldemtOfOdvupDqu2SL+ieC5jRLvULy0+7ejsU=";
        };
      };
    });
  };
  meta = {
    description = "Tesla ROS2 interface for Webots.";
  };
})
