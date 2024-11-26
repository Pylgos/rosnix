{
  ament-cmake,
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  backward-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nlohmann-json-schema-validator-vendor,
  rclcpp,
  rclcpp-components,
  rmf-api-msgs,
  rmf-battery,
  rmf-building-map-msgs,
  rmf-dispenser-msgs,
  rmf-door-msgs,
  rmf-fleet-msgs,
  rmf-ingestor-msgs,
  rmf-lift-msgs,
  rmf-task,
  rmf-task-msgs,
  rmf-task-ros2,
  rmf-task-sequence,
  rmf-traffic,
  rmf-traffic-ros2,
  rmf-utils,
  rmf-websocket,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_fleet_adapter";
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."rmf_fleet_adapter";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros nlohmann-json-schema-validator-vendor rclcpp rclcpp-components rmf-api-msgs rmf-battery rmf-building-map-msgs rmf-dispenser-msgs rmf-door-msgs rmf-fleet-msgs rmf-ingestor-msgs rmf-lift-msgs rmf-task rmf-task-msgs rmf-task-ros2 rmf-task-sequence rmf-traffic rmf-traffic-ros2 rmf-utils rmf-websocket std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_fleet_adapter" = substituteSource {
        src = fetchgit {
          name = "rmf_fleet_adapter-source";
          url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
          rev = "e954912b45d187dcfe3efa3cb0d4b7182d34996b";
          hash = "sha256-oQ0/oL7OkU5P/UTAStvoPh/dF525gW4Idrj15egR9rw=";
        };
      };
    });
  };
  meta = {
    description = "Fleet Adapter package for RMF fleets.";
  };
})
