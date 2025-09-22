{
  buildAmentPythonPackage,
  dynamixel-hardware-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  ffw-description,
  gz-ros2-control,
  image-transport-plugins,
  mkSourceSet,
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
  pname = "ffw_bringup";
  version = "1.1.12-1";
  src = finalAttrs.passthru.sources."ffw_bringup";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ dynamixel-hardware-interface ffw-description gz-ros2-control image-transport-plugins rclpy robot-state-publisher ros2-control ros2-controllers ros-gz-bridge ros-gz-image ros-gz-sim rviz2 xacro ];
  propagatedBuildInputs = [ dynamixel-hardware-interface ffw-description gz-ros2-control image-transport-plugins rclpy robot-state-publisher ros2-control ros2-controllers ros-gz-bridge ros-gz-image ros-gz-sim rviz2 xacro ];
  passthru.sources = mkSourceSet (sources: {
    "ffw_bringup" = substituteSource {
      src = fetchgit {
        name = "ffw_bringup-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "6f18dde7a8986738126ab796ca83a18dd5375753";
        hash = "sha256-kMUpGsGezj69NrNF2fxxHDnPNWEjXB1oITNQH+gLRes=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for starting the FFW\n  ";
  };
})
