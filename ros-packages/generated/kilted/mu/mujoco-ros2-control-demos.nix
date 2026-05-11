{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward-command-controller,
  joint-state-broadcaster,
  mkSourceSet,
  mujoco-ros2-control,
  mujoco-ros2-control-msgs,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mujoco_ros2_control_demos";
  version = "0.0.3-1";
  src = finalAttrs.passthru.sources."mujoco_ros2_control_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager forward-command-controller joint-state-broadcaster mujoco-ros2-control mujoco-ros2-control-msgs robot-state-publisher rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager forward-command-controller joint-state-broadcaster mujoco-ros2-control mujoco-ros2-control-msgs robot-state-publisher rviz2 xacro ];
  passthru.sources = mkSourceSet (sources: {
    "mujoco_ros2_control_demos" = substituteSource {
      src = fetchgit {
        name = "mujoco_ros2_control_demos-source";
        url = "https://github.com/ros2-gbp/mujoco_ros2_control-release.git";
        rev = "6c306833078f806db1fa0c4fedbb4d4304888b01";
        hash = "sha256-ux7bssHwECZ2hXjccjVIqbBtiDAJBtRYAMWjbIxnKuY=";
      };
    };
  });
  meta = {
    description = "Demonstration examples for mujoco_ros2_control package";
  };
})
