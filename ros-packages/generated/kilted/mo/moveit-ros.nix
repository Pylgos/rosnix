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
  version = "2.14.3-1";
  src = finalAttrs.passthru.sources."moveit_ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-ros-benchmarks moveit-ros-move-group moveit-ros-planning moveit-ros-planning-interface moveit-ros-robot-interaction moveit-ros-visualization moveit-ros-warehouse ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-ros-benchmarks moveit-ros-move-group moveit-ros-planning moveit-ros-planning-interface moveit-ros-robot-interaction moveit-ros-visualization moveit-ros-warehouse ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros" = substituteSource {
      src = fetchgit {
        name = "moveit_ros-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "fd0c13ae5d128bfe5484e2bbcb976da391463aee";
        hash = "sha256-4FpBXvwN4T9KFxDjbDs1akPmLqbLiMFjGXhhU4vvZIw=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt that use ROS";
  };
})
