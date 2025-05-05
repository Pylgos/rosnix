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
  rmf-fleet-msgs,
  rmf-robot-sim-common,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_robot_sim_gz_plugins";
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."rmf_robot_sim_gz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gz-gui-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-sim-vendor gz-transport-vendor rclcpp rmf-building-map-msgs rmf-building-sim-gz-plugins rmf-fleet-msgs rmf-robot-sim-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gz-gui-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-sim-vendor gz-transport-vendor rclcpp rmf-building-map-msgs rmf-building-sim-gz-plugins rmf-fleet-msgs rmf-robot-sim-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_robot_sim_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_gz_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "dad8ec1cc0372d0ea54d0c7460353cbef3e988b9";
        hash = "sha256-e+6jiEUAUM6HvN1lojZFswvF/+HMSRZmkV2PAVYUej8=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 Gazebo plugins for TeleportIngestors and TeleportDispensers\n  ";
  };
})
