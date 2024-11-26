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
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-ros-benchmarks moveit-ros-move-group moveit-ros-planning moveit-ros-planning-interface moveit-ros-robot-interaction moveit-ros-visualization moveit-ros-warehouse ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_ros" = substituteSource {
        src = fetchgit {
          name = "moveit_ros-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "892a548c79100fe246e5230d1a4319cc0b1222a6";
          hash = "sha256-hRBtjcp1PnATPTuIVhroUdtnXgo/Lihj0Dd+FF7Gsnk=";
        };
      };
    });
  };
  meta = {
    description = "Components of MoveIt that use ROS";
  };
})
