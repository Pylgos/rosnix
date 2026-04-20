{
  buildAmentPythonPackage,
  dynamixel-hardware-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-ros2-control,
  mkSourceSet,
  open-manipulator-description,
  rclpy,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-image,
  ros-gz-sim,
  ros2-control,
  ros2-controllers,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "open_manipulator_bringup";
  version = "4.1.3-1";
  src = finalAttrs.passthru.sources."open_manipulator_bringup";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ dynamixel-hardware-interface gz-ros2-control open-manipulator-description rclpy robot-state-publisher ros2-control ros2-controllers ros-gz-bridge ros-gz-image ros-gz-sim rviz2 xacro ];
  propagatedBuildInputs = [ dynamixel-hardware-interface gz-ros2-control open-manipulator-description rclpy robot-state-publisher ros2-control ros2-controllers ros-gz-bridge ros-gz-image ros-gz-sim rviz2 xacro ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_bringup" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_bringup-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "6c0aadc8725086959cdcc15c117056cd4e0a9ead";
        hash = "sha256-5nBk7ko2nG98ELt2pz6+VaDL2jMXs0rFQEdZdrrbzJg=";
      };
    };
  });
  meta = {
    description = "OpenMANIPULATOR bringup ROS 2 package.";
  };
})
