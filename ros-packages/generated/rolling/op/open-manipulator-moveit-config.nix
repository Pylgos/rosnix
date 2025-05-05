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
  moveit-ros-warehouse,
  moveit-setup-assistant,
  moveit-simple-controller-manager,
  open-manipulator-description,
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
  pname = "open_manipulator_moveit_config";
  version = "3.2.2-1";
  src = finalAttrs.passthru.sources."open_manipulator_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-ros-warehouse moveit-setup-assistant moveit-simple-controller-manager open-manipulator-description robot-state-publisher rviz2 rviz-common rviz-default-plugins tf2-ros xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-ros-warehouse moveit-setup-assistant moveit-simple-controller-manager open-manipulator-description robot-state-publisher rviz2 rviz-common rviz-default-plugins tf2-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_moveit_config" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_moveit_config-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "388372f656e19d83d051d4c2df8946239795946e";
        hash = "sha256-Lkds4pIpcvYxfVCLvqMsC4kMo87mKHyJK3pmk+19AeI=";
      };
    };
  });
  meta = {
    description = "\n     An automatically generated package with all the configuration and launch files for using the open_manipulator_x with the MoveIt Motion Planning Framework\n  ";
  };
})
