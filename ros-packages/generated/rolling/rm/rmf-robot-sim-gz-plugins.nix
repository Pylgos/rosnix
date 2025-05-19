{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-gui-vendor,
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
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."rmf_robot_sim_gz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gz-gui-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-sim-vendor gz-transport-vendor rclcpp rmf-building-map-msgs rmf-building-sim-gz-plugins rmf-dispenser-msgs rmf-fleet-msgs rmf-ingestor-msgs rmf-robot-sim-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gz-gui-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-sim-vendor gz-transport-vendor rclcpp rmf-building-map-msgs rmf-building-sim-gz-plugins rmf-dispenser-msgs rmf-fleet-msgs rmf-ingestor-msgs rmf-robot-sim-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_robot_sim_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_gz_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "1e99c73cecf3758622ee742b4d2dcb052b07f28c";
        hash = "sha256-pSJjKGQKrUvWIK6qaUOYNNVscIMJy9vpTBEcA/OPdO8=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 Gazebo plugins for TeleportIngestors and TeleportDispensers\n  ";
  };
})
