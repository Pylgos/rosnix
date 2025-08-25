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
  warehouse-ros-sqlite,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator_moveit_config";
  version = "4.0.7-1";
  src = finalAttrs.passthru.sources."open_manipulator_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-ros-warehouse moveit-setup-assistant moveit-simple-controller-manager open-manipulator-description robot-state-publisher rviz2 rviz-common rviz-default-plugins tf2-ros warehouse-ros-sqlite xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-ros-warehouse moveit-setup-assistant moveit-simple-controller-manager open-manipulator-description robot-state-publisher rviz2 rviz-common rviz-default-plugins tf2-ros warehouse-ros-sqlite xacro ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_moveit_config" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_moveit_config-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "bb1f57f7e3bb1897ad6113fbe8e1285e40285888";
        hash = "sha256-6Joxcbq9VyJbZpgwiSzf0W5lDG9I9OINa0B5EgDAImQ=";
      };
    };
  });
  meta = {
    description = "\n     An automatically generated package with all the configuration and launch files for using the open_manipulator_x with the MoveIt Motion Planning Framework\n  ";
  };
})
