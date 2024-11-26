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
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."moveit_ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-ros-benchmarks moveit-ros-move-group moveit-ros-planning moveit-ros-planning-interface moveit-ros-robot-interaction moveit-ros-visualization moveit-ros-warehouse ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_ros" = substituteSource {
        src = fetchgit {
          name = "moveit_ros-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "d8dec5fc61afd7dae561b5faf139ecb9441b5e1d";
          hash = "sha256-kkcNavYAbOwJcZxhvch6Zb4PRTlKrVbKbNqtMAOGrrI=";
        };
      };
    });
  };
  meta = {
    description = "Components of MoveIt that use ROS";
  };
})
