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
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit_ros_warehouse";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-common moveit-core moveit-ros-planning rclcpp tf2-eigen tf2-ros warehouse-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_warehouse" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_warehouse-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "f3868374b4772ca0587a4da4c85e85a875b93e12";
        hash = "sha256-agch1Z9JA6L7ErGAMVsOrurUfLsaZUIX04BT+9fBAwQ=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt connecting to MongoDB";
  };
})
