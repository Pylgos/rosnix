{
  ament-cmake,
  ament-cmake-catch2,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  menge-vendor,
  mkSourceSet,
  nlohmann-json-schema-validator-vendor,
  pybind11-json-vendor,
  rmf-api-msgs,
  rmf-battery,
  rmf-building-map-msgs,
  rmf-building-map-tools,
  rmf-building-sim-gz-plugins,
  rmf-charger-msgs,
  rmf-dispenser-msgs,
  rmf-door-msgs,
  rmf-fleet-adapter,
  rmf-fleet-adapter-python,
  rmf-fleet-msgs,
  rmf-ingestor-msgs,
  rmf-lift-msgs,
  rmf-obstacle-msgs,
  rmf-robot-sim-common,
  rmf-robot-sim-gz-plugins,
  rmf-scheduler-msgs,
  rmf-site-map-msgs,
  rmf-task,
  rmf-task-msgs,
  rmf-task-ros2,
  rmf-task-sequence,
  rmf-traffic,
  rmf-traffic-editor,
  rmf-traffic-editor-assets,
  rmf-traffic-editor-test-maps,
  rmf-traffic-examples,
  rmf-traffic-msgs,
  rmf-traffic-ros2,
  rmf-utils,
  rmf-visualization,
  rmf-visualization-building-systems,
  rmf-visualization-fleet-states,
  rmf-visualization-floorplans,
  rmf-visualization-msgs,
  rmf-visualization-navgraphs,
  rmf-visualization-obstacles,
  rmf-visualization-rviz2-plugins,
  rmf-visualization-schedule,
  rmf-websocket,
  rmf-workcell-msgs,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_dev";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."rmf_dev";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-cmake-catch2 menge-vendor nlohmann-json-schema-validator-vendor pybind11-json-vendor rmf-api-msgs rmf-battery rmf-building-map-msgs rmf-building-map-tools rmf-building-sim-gz-plugins rmf-charger-msgs rmf-dispenser-msgs rmf-door-msgs rmf-fleet-adapter rmf-fleet-adapter-python rmf-fleet-msgs rmf-ingestor-msgs rmf-lift-msgs rmf-obstacle-msgs rmf-robot-sim-common rmf-robot-sim-gz-plugins rmf-scheduler-msgs rmf-site-map-msgs rmf-task rmf-task-msgs rmf-task-ros2 rmf-task-sequence rmf-traffic rmf-traffic-editor rmf-traffic-editor-assets rmf-traffic-editor-test-maps rmf-traffic-examples rmf-traffic-msgs rmf-traffic-ros2 rmf-utils rmf-visualization rmf-visualization-building-systems rmf-visualization-fleet-states rmf-visualization-floorplans rmf-visualization-msgs rmf-visualization-navgraphs rmf-visualization-obstacles rmf-visualization-rviz2-plugins rmf-visualization-schedule rmf-websocket rmf-workcell-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_dev" = substituteSource {
      src = fetchgit {
        name = "rmf_dev-source";
        url = "https://github.com/ros2-gbp/rmf_variants-release.git";
        rev = "844b092fe10885f11327c84f9f7c1fd7ffdcee12";
        hash = "sha256-XThgYJiLzrj6OBp7jqdHvFPpT5xTuTKIEv2Yz2DoDIU=";
      };
    };
  });
  meta = {
    description = "A package to aggregate the packages required for a minimal installation of Open-RMF";
  };
})
