{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "joy_linux";
  version = "3.3.0-3";
  src = finalAttrs.passthru.sources."joy_linux";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater rclcpp sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "joy_linux" = substituteSource {
        src = fetchgit {
          name = "joy_linux-source";
          url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
          rev = "fd06a72f341af1e90fad0c24ff51ffa212ca38c9";
          hash = "sha256-MCxXwhqUhQHqDvJeyzEVpjLjHtbbIKly+aduefEBefM=";
        };
      };
    });
  };
  meta = {
    description = "ROS2 driver for a generic Linux joystick. Will contain a MacOS and Windows version later. The joy package contains joy_node, a node that interfaces a generic Linux joystick to ROS2. This node publishes a \"Joy\" message, which contains the current state of each one of the joystick's buttons and axes.";
  };
})
