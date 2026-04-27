{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-configs-utils,
  moveit-kinematics,
  moveit-msgs,
  moveit-planners,
  moveit-ros-move-group,
  moveit-ros-planning,
  moveit-ros-planning-interface,
  moveit-ros-visualization,
  moveit-servo,
  moveit-setup-assistant,
  moveit-simple-controller-manager,
  rclcpp,
  rosSystemPackages,
  rosbot-description,
  rosbot-joy,
  rviz-common,
  rviz-default-plugins,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_moveit";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."rosbot_moveit";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-configs-utils moveit-kinematics moveit-msgs moveit-planners moveit-ros-move-group moveit-ros-planning moveit-ros-planning-interface moveit-ros-visualization moveit-servo moveit-setup-assistant moveit-simple-controller-manager rclcpp rosbot-description rosbot-joy rviz2 rviz-common rviz-default-plugins ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-configs-utils moveit-kinematics moveit-msgs moveit-planners moveit-ros-move-group moveit-ros-planning moveit-ros-planning-interface moveit-ros-visualization moveit-servo moveit-setup-assistant moveit-simple-controller-manager rclcpp rosbot-description rosbot-joy rviz2 rviz-common rviz-default-plugins ];
  passthru.sources = mkSourceSet (sources: {
    "rosbot_moveit" = substituteSource {
      src = fetchgit {
        name = "rosbot_moveit-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "0d2002fff0ed415e42344b787ff0055c365e7df0";
        hash = "sha256-Zno6MTwps3gfTpO29YQ1qP/KCno7rJQ03HDoJuczFBs=";
      };
    };
  });
  meta = {
    description = "An automatically generated package with all the configuration and launch files for using the rosbot_xl with the MoveIt Motion Planning Framework";
  };
})
