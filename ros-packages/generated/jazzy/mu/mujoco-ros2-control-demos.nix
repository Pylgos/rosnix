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
  version = "0.0.2-1";
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
        rev = "dc04e63ebd7fcd29f9fad33d7e1dfd8d9541b35e";
        hash = "sha256-zNsoxfOhIRiMaG1EcVElzIknL3sm895IP1rqw9uOrTI=";
      };
    };
  });
  meta = {
    description = "Demonstration examples for mujoco_ros2_control package";
  };
})
