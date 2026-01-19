{
  ament-cmake,
  bcr-arm-description,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  moveit-configs-utils,
  moveit-kinematics,
  moveit-planners,
  moveit-ros-move-group,
  moveit-ros-visualization,
  moveit-setup-assistant,
  moveit-simple-controller-manager,
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
  pname = "bcr_arm_moveit_config";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."bcr_arm_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ bcr-arm-description controller-manager joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-setup-assistant moveit-simple-controller-manager robot-state-publisher rviz2 rviz-common rviz-default-plugins tf2-ros xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bcr-arm-description controller-manager joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-setup-assistant moveit-simple-controller-manager robot-state-publisher rviz2 rviz-common rviz-default-plugins tf2-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "bcr_arm_moveit_config" = substituteSource {
      src = fetchgit {
        name = "bcr_arm_moveit_config-source";
        url = "https://github.com/ros2-gbp/bcr_arm-release.git";
        rev = "aaadae463b7440743650ca44e9b46302cd1c1603";
        hash = "sha256-T2DqPdK8UxI0rKc6K+n6x5yQAYN/ZayzFImZrdOG6Qc=";
      };
    };
  });
  meta = {
    description = "moveit configuration and launch files for motion planning with the bcr arm";
  };
})
