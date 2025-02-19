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
  version = "2.12.2-1";
  src = finalAttrs.passthru.sources."moveit_ros_warehouse";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-common moveit-core moveit-ros-planning rclcpp tf2-eigen tf2-ros warehouse-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_warehouse" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_warehouse-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "bcf5daef7e2904eb27ea515fe876d7d9f9eb49bb";
        hash = "sha256-Zs0sZI2i+q2N455TVwKVDkvFiwLnkNX8xXnvWgmIQ5Q=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt connecting to MongoDB";
  };
})
