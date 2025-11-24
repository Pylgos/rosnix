{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-msgs-vendor,
  gz-plugin-vendor,
  gz-rendering-vendor,
  gz-sim-vendor,
  gz-transport-vendor,
  mkSourceSet,
  rclcpp,
  rmf-building-map-msgs,
  rmf-building-sim-gz-plugins,
  rmf-dispenser-msgs,
  rmf-fleet-msgs,
  rmf-ingestor-msgs,
  rmf-robot-sim-common,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_robot_sim_gz_plugins";
  version = "2.6.1-1";
  src = finalAttrs.passthru.sources."rmf_robot_sim_gz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-sim-vendor gz-transport-vendor rclcpp rmf-building-map-msgs rmf-building-sim-gz-plugins rmf-dispenser-msgs rmf-fleet-msgs rmf-ingestor-msgs rmf-robot-sim-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-sim-vendor gz-transport-vendor rclcpp rmf-building-map-msgs rmf-building-sim-gz-plugins rmf-dispenser-msgs rmf-fleet-msgs rmf-ingestor-msgs rmf-robot-sim-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_robot_sim_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_gz_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "eff87a3491e5c7354b7c6bde19f4634584e6324e";
        hash = "sha256-oW5KnhylrSf5An7KgQMYgNOKhSI1v7vfAaLliZy1zP8=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 Gazebo plugins for TeleportIngestors and TeleportDispensers\n  ";
  };
})
