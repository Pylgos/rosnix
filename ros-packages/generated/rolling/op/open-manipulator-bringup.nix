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
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."open_manipulator_bringup";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ dynamixel-hardware-interface gz-ros2-control open-manipulator-description rclpy robot-state-publisher ros2-control ros2-controllers ros-gz-bridge ros-gz-image ros-gz-sim rviz2 xacro ];
  propagatedBuildInputs = [ dynamixel-hardware-interface gz-ros2-control open-manipulator-description rclpy robot-state-publisher ros2-control ros2-controllers ros-gz-bridge ros-gz-image ros-gz-sim rviz2 xacro ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_bringup" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_bringup-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "dc2b39eed0d5b807cf987f08627c1a80e0472f41";
        hash = "sha256-/WkjtDk1GbndvOkZoV5x202IZ04R54Ptad977TK/aKo=";
      };
    };
  });
  meta = {
    description = "OpenMANIPULATOR bringup ROS 2 package.";
  };
})
