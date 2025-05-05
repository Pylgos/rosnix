{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  crane-plus-description,
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
  pname = "crane_plus_moveit_config";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."crane_plus_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager crane-plus-description joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-ros-warehouse moveit-setup-assistant moveit-simple-controller-manager robot-state-publisher rviz2 rviz-common rviz-default-plugins tf2-ros xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager crane-plus-description joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-ros-warehouse moveit-setup-assistant moveit-simple-controller-manager robot-state-publisher rviz2 rviz-common rviz-default-plugins tf2-ros xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "crane_plus_moveit_config" = substituteSource {
      src = fetchgit {
        name = "crane_plus_moveit_config-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "c04fead827aa66ba60f2af8a76343361121d06d5";
        hash = "sha256-OHK381dMqa/RrvNsqKnv1Q5CPmw9IxnrVFDM5UaRmKE=";
      };
    };
  });
  meta = {
    description = "CRANE+ V2 move_group config package";
  };
})
