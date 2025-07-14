{
  ament-cmake,
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
  pname = "ffw_moveit_config";
  version = "1.1.7-1";
  src = finalAttrs.passthru.sources."ffw_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-setup-assistant moveit-simple-controller-manager robot-state-publisher rviz2 rviz-common rviz-default-plugins tf2-ros xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-setup-assistant moveit-simple-controller-manager robot-state-publisher rviz2 rviz-common rviz-default-plugins tf2-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "ffw_moveit_config" = substituteSource {
      src = fetchgit {
        name = "ffw_moveit_config-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "f302309a98cddcee819af0ebd0882666e11a76d5";
        hash = "sha256-G4sFjmMxXpOnDtt8ePV+tH3125/lfrIlT73oEB8yevg=";
      };
    };
  });
  meta = {
    description = "\n     An automatically generated package with all the configuration and launch files for using the ffw with the MoveIt Motion Planning Framework\n  ";
  };
})
