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
  moveit-servo,
  moveit-setup-assistant,
  moveit-simple-controller-manager,
  rosSystemPackages,
  rosbot-description,
  rosbot-joy,
  rviz-common,
  rviz-default-plugins,
  rviz2,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_moveit";
  version = "0.18.6-1";
  src = finalAttrs.passthru.sources."rosbot_moveit";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-servo moveit-setup-assistant moveit-simple-controller-manager rosbot-description rosbot-joy rviz2 rviz-common rviz-default-plugins tf2-ros xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-servo moveit-setup-assistant moveit-simple-controller-manager rosbot-description rosbot-joy rviz2 rviz-common rviz-default-plugins tf2-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "rosbot_moveit" = substituteSource {
      src = fetchgit {
        name = "rosbot_moveit-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "c270508f5e69cd1659a6b6dd03b29f4ba12df384";
        hash = "sha256-43ViMnWzPFAkMUf/CGHsXEyxHeZ7EEH53sx9VKZdy1E=";
      };
    };
  });
  meta = {
    description = "An automatically generated package with all the configuration and launch files for using the rosbot_xl with the MoveIt Motion Planning Framework";
  };
})
