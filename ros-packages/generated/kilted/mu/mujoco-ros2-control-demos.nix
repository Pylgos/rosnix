{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  mkSourceSet,
  mujoco-ros2-control,
  mujoco-ros2-control-msgs,
  position-controllers,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mujoco_ros2_control_demos";
  version = "0.0.1-1";
  src = finalAttrs.passthru.sources."mujoco_ros2_control_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager joint-state-broadcaster mujoco-ros2-control mujoco-ros2-control-msgs position-controllers robot-state-publisher rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager joint-state-broadcaster mujoco-ros2-control mujoco-ros2-control-msgs position-controllers robot-state-publisher rviz2 xacro ];
  passthru.sources = mkSourceSet (sources: {
    "mujoco_ros2_control_demos" = substituteSource {
      src = fetchgit {
        name = "mujoco_ros2_control_demos-source";
        url = "https://github.com/ros2-gbp/mujoco_ros2_control-release.git";
        rev = "c38d53801076a863d8f03abb2b0d733ba5abf06e";
        hash = "sha256-3+g6SNdIjWwvyobAuA/prSKl7iWK1DPAVXMDk46Qz4c=";
      };
    };
  });
  meta = {
    description = "Demonstration examples for mujoco_ros2_control package";
  };
})
