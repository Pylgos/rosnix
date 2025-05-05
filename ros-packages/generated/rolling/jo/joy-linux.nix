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
  version = "3.3.0-2";
  src = finalAttrs.passthru.sources."joy_linux";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "joy_linux" = substituteSource {
      src = fetchgit {
        name = "joy_linux-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "3ba3794b6061c3c7a1ed7904cbc5d337a57c6fec";
        hash = "sha256-MCxXwhqUhQHqDvJeyzEVpjLjHtbbIKly+aduefEBefM=";
      };
    };
  });
  meta = {
    description = "ROS2 driver for a generic Linux joystick. Will contain a MacOS and Windows version later. The joy package contains joy_node, a node that interfaces a generic Linux joystick to ROS2. This node publishes a \"Joy\" message, which contains the current state of each one of the joystick's buttons and axes.";
  };
})
