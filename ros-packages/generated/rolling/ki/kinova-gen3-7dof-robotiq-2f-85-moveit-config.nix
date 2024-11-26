{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  kortex-description,
  mkSourceSet,
  moveit-configs-utils,
  moveit-kinematics,
  moveit-planners,
  moveit-ros-move-group,
  moveit-ros-visualization,
  moveit-ros-warehouse,
  moveit-setup-assistant,
  moveit-simple-controller-manager,
  picknik-reset-fault-controller,
  picknik-twist-controller,
  robot-state-publisher,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz2,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kinova_gen3_7dof_robotiq_2f_85_moveit_config";
  version = "0.2.2-2";
  src = finalAttrs.passthru.sources."kinova_gen3_7dof_robotiq_2f_85_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ controller-manager joint-state-publisher joint-state-publisher-gui kortex-description moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-ros-warehouse moveit-setup-assistant moveit-simple-controller-manager picknik-reset-fault-controller picknik-twist-controller robot-state-publisher rviz2 rviz-common rviz-default-plugins tf2-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "kinova_gen3_7dof_robotiq_2f_85_moveit_config" = substituteSource {
      src = fetchgit {
        name = "kinova_gen3_7dof_robotiq_2f_85_moveit_config-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "8afdd055442af8a24ef81523213282e3e2b8dbff";
        hash = "sha256-/NaCg83rG2s+hq+mRhy/8nEZv10V548lKYoEUVBCEc8=";
      };
    };
  });
  meta = {
    description = "An automatically generated package with all the configuration and launch files for using the gen3 with the MoveIt Motion Planning Framework";
  };
})
