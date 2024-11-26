{
  ament-cmake,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rmf-building-map-msgs,
  rmf-dispenser-msgs,
  rmf-fleet-msgs,
  rmf-ingestor-msgs,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_robot_sim_common";
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."rmf_robot_sim_common";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rmf-building-map-msgs rmf-dispenser-msgs rmf-fleet-msgs rmf-ingestor-msgs std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_robot_sim_common" = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_common-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "bf398a6237e30e0c0a49a6c5dad3b9dd11760b05";
        hash = "sha256-tl9DYl2BZEQntp5c2VquCEbjOTJ8LBDYuak85Gm9H7Y=";
      };
    };
  });
  meta = {
    description = "Common utility functions for Gazebo-classic and Gazebo RMF plugins";
  };
})
