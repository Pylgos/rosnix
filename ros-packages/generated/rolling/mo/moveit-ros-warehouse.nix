{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-ros-planning,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-eigen,
  tf2-ros,
  warehouse-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_warehouse";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_ros_warehouse";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-common moveit-core moveit-ros-planning rclcpp tf2-eigen tf2-ros warehouse-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_warehouse" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_warehouse-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "7f58f4e2c12b1797614b1bd04cc7b1e15d2ddb08";
        hash = "sha256-FP/eDaSSwAfPa084EZKYUvHx4/imyfXOxOeKuzlBmgY=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt connecting to MongoDB";
  };
})
