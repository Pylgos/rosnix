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
let
  sources = mkSourceSet (sources: {
    "rmf_dev" = substituteSource {
      src = fetchgit {
        name = "rmf_dev-source";
        url = "https://github.com/ros2-gbp/rmf_variants-release.git";
        rev = "6df76b4024e822ab3669ae7f131f7828255e587a";
        hash = "sha256-1zapMn4jZKX6C1ftizIpnt9WJ+DERnvtTUHY3p4zBVY=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_dev";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."rmf_dev";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-catch2 menge-vendor nlohmann-json-schema-validator-vendor pybind11-json-vendor rmf-api-msgs rmf-battery rmf-building-map-msgs rmf-building-map-tools rmf-building-sim-gz-plugins rmf-charger-msgs rmf-dispenser-msgs rmf-door-msgs rmf-fleet-adapter rmf-fleet-adapter-python rmf-fleet-msgs rmf-ingestor-msgs rmf-lift-msgs rmf-obstacle-msgs rmf-robot-sim-common rmf-robot-sim-gz-plugins rmf-scheduler-msgs rmf-site-map-msgs rmf-task rmf-task-msgs rmf-task-ros2 rmf-task-sequence rmf-traffic rmf-traffic-editor rmf-traffic-editor-assets rmf-traffic-editor-test-maps rmf-traffic-examples rmf-traffic-msgs rmf-traffic-ros2 rmf-utils rmf-visualization rmf-visualization-building-systems rmf-visualization-fleet-states rmf-visualization-floorplans rmf-visualization-msgs rmf-visualization-navgraphs rmf-visualization-obstacles rmf-visualization-rviz2-plugins rmf-visualization-schedule rmf-websocket rmf-workcell-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "A package to aggregate the packages required for a minimal installation of Open-RMF";
  };
})
