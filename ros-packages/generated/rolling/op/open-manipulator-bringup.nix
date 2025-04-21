{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gripper-controllers,
  gz-ros2-control,
  mkSourceSet,
  open-manipulator-description,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator_bringup";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."open_manipulator_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ gripper-controllers gz-ros2-control open-manipulator-description robot-state-publisher ros2-control ros2-controllers ros-gz-bridge ros-gz-image ros-gz-sim rviz2 xacro ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_bringup" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_bringup-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "5cf88f9adf5281a8c6d8e5befbe24c457f0cd45a";
        hash = "sha256-Omnug/1febShCveraEqquN9CddpcLCXzeJVq/POpdgw=";
      };
    };
  });
  meta = {
    description = "OpenMANIPULATOR bringup ROS 2 package.";
  };
})
