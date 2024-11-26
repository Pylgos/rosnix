{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-configs-utils,
  moveit-kinematics,
  moveit-planners,
  moveit-planners-chomp,
  moveit-ros-move-group,
  moveit-ros-visualization,
  moveit-servo,
  moveit-simple-controller-manager,
  rosSystemPackages,
  substituteSource,
  ur-description,
  warehouse-ros-sqlite,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_moveit_config";
  version = "2.4.13-1";
  src = finalAttrs.passthru.sources."ur_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-configs-utils moveit-kinematics moveit-planners moveit-planners-chomp moveit-ros-move-group moveit-ros-visualization moveit-servo moveit-simple-controller-manager ur-description warehouse-ros-sqlite xacro ];
  passthru.sources = mkSourceSet (sources: {
    "ur_moveit_config" = substituteSource {
      src = fetchgit {
        name = "ur_moveit_config-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "8e859126898f592472a585feb3b4126bc27c9da5";
        hash = "sha256-5fHMGMBSwYJVulIgY9d8GffQumLubLb0CGQtTiMW2Sg=";
      };
    };
  });
  meta = {
    description = "An example package with MoveIt2 configurations for UR robots.";
  };
})
