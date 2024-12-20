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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_ros_warehouse";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-common moveit-core moveit-ros-planning rclcpp tf2-eigen tf2-ros warehouse-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_warehouse" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_warehouse-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "8f9b5a70114989c26aed2bd362d2c2a7c043a348";
        hash = "sha256-dKsZ9kVye2OsYgvg4Uc2uIu+mpg1jnin0Ha03qHqcpA=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt connecting to MongoDB";
  };
})
