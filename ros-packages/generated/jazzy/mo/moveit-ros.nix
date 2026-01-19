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
  version = "2.12.4-1";
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
        rev = "6f5ed6db454f803576fcd6df05bb1f18fcde9f6b";
        hash = "sha256-PX0EjbTbOgGBYGzpTt/ExRrFq+f+Owu8CWEoj1I1424=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt that use ROS";
  };
})
