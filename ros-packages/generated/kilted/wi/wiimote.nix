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
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-msgs std-srvs wiimote-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cwiid" "cwiid-dev" "libbluetooth" "libbluetooth-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-auto ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-msgs std-srvs wiimote-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cwiid" "cwiid-dev" "libbluetooth" "libbluetooth-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "wiimote" = substituteSource {
      src = fetchgit {
        name = "wiimote-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "e016324b04642dc91bd80e5dc55f35df606f252a";
        hash = "sha256-WghWanmw0GXmNOdR/EHg1/ytIXNtIKstCe5hSIgpQ/s=";
      };
    };
  });
  meta = {
    description = "\n    The wiimote package allows ROS nodes to communicate with a Nintendo Wiimote\n    and its related peripherals, including the Nunchuk, Motion Plus, and\n    (experimentally) the Classic. The package implements a ROS node that uses\n    Bluetooth to communicate with the Wiimote device, obtaining accelerometer\n    and gyro data, the state of LEDs, the IR camera, rumble (vibrator),\n    buttons, joystick, and battery state. The node additionally enables ROS\n    nodes to control the Wiimote's LEDs and vibration for feedback to the human\n    Wiimote operator. LEDs and vibration may be switched on and off, or made to\n    operate according to a timed pattern.\n  ";
  };
})
