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
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."ur_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-configs-utils moveit-kinematics moveit-planners moveit-planners-chomp moveit-ros-move-group moveit-ros-visualization moveit-servo moveit-simple-controller-manager ur-description warehouse-ros-sqlite xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-configs-utils moveit-kinematics moveit-planners moveit-planners-chomp moveit-ros-move-group moveit-ros-visualization moveit-servo moveit-simple-controller-manager ur-description warehouse-ros-sqlite xacro ];
  passthru.sources = mkSourceSet (sources: {
    "ur_moveit_config" = substituteSource {
      src = fetchgit {
        name = "ur_moveit_config-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "6674ea65b675e4d33b95de54fa212ea10a8543bf";
        hash = "sha256-RkJqNkeYX/ueEZyKYxjmJA9R8ReBJK9CCjvjgQLAmck=";
      };
    };
  });
  meta = {
    description = "\n     An example package with MoveIt2 configurations for UR robots.\n  ";
  };
})
