{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  wiimote-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "wiimote";
  version = "3.3.0-3";
  src = finalAttrs.passthru.sources."wiimote";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-msgs std-srvs wiimote-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cwiid" "cwiid-dev" "libbluetooth" "libbluetooth-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "wiimote" = substituteSource {
        src = fetchgit {
          name = "wiimote-source";
          url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
          rev = "511ae4275bf3980a65c8af0f85f1e07748487b7e";
          hash = "sha256-WghWanmw0GXmNOdR/EHg1/ytIXNtIKstCe5hSIgpQ/s=";
        };
      };
    });
  };
  meta = {
    description = "The wiimote package allows ROS nodes to communicate with a Nintendo Wiimote and its related peripherals, including the Nunchuk, Motion Plus, and (experimentally) the Classic. The package implements a ROS node that uses Bluetooth to communicate with the Wiimote device, obtaining accelerometer and gyro data, the state of LEDs, the IR camera, rumble (vibrator), buttons, joystick, and battery state. The node additionally enables ROS nodes to control the Wiimote's LEDs and vibration for feedback to the human Wiimote operator. LEDs and vibration may be switched on and off, or made to operate according to a timed pattern.";
  };
})
