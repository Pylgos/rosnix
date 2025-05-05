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
  rmf-reservation-msgs,
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
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."rmf_fleet_adapter";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  propagatedBuildInputs = [ backward-ros nlohmann-json-schema-validator-vendor rclcpp-components rmf-api-msgs rmf-battery rmf-building-map-msgs rmf-dispenser-msgs rmf-door-msgs rmf-fleet-msgs rmf-ingestor-msgs rmf-lift-msgs rmf-reservation-msgs rmf-task rmf-task-msgs rmf-task-ros2 rmf-task-sequence rmf-traffic rmf-traffic-ros2 rmf-utils rmf-websocket std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_fleet_adapter" = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_adapter-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "90275ce51c474a20e71a19c2cc62e65f534bb74c";
        hash = "sha256-m3hfuawzhPE6G/E/ZNpP+yyUxRUgY7B45bgVA4oWB4Q=";
      };
    };
  });
  meta = {
    description = "Fleet Adapter package for RMF fleets.";
  };
})
