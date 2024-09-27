{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  wiimote_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "wiimote" = substituteSource {
      src = fetchgit {
        name = "wiimote-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "511ae4275bf3980a65c8af0f85f1e07748487b7e";
        hash = "sha256-WghWanmw0GXmNOdR/EHg1/ytIXNtIKstCe5hSIgpQ/s=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "wiimote";
  version = "3.3.0-3";
  src = sources."wiimote";
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclcpp rclcpp_components rclcpp_lifecycle sensor_msgs std_msgs std_srvs wiimote_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cwiid" "cwiid-dev" "libbluetooth" "libbluetooth-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The wiimote package allows ROS nodes to communicate with a Nintendo Wiimote and its related peripherals, including the Nunchuk, Motion Plus, and (experimentally) the Classic. The package implements a ROS node that uses Bluetooth to communicate with the Wiimote device, obtaining accelerometer and gyro data, the state of LEDs, the IR camera, rumble (vibrator), buttons, joystick, and battery state. The node additionally enables ROS nodes to control the Wiimote's LEDs and vibration for feedback to the human Wiimote operator. LEDs and vibration may be switched on and off, or made to operate according to a timed pattern.";
  };
}
