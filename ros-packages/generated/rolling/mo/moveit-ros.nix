{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-ros-benchmarks,
  moveit-ros-move-group,
  moveit-ros-planning,
  moveit-ros-planning-interface,
  moveit-ros-robot-interaction,
  moveit-ros-visualization,
  moveit-ros-warehouse,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-ros-benchmarks moveit-ros-move-group moveit-ros-planning moveit-ros-planning-interface moveit-ros-robot-interaction moveit-ros-visualization moveit-ros-warehouse ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros" = substituteSource {
      src = fetchgit {
        name = "moveit_ros-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5ee7bc28046b88cb9a23e8a68463a0d038e27cf1";
        hash = "sha256-ghHUmpFnBsuGuANdoiIPKTiLVU/G3/daE1gao9c1coA=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt that use ROS";
  };
})
