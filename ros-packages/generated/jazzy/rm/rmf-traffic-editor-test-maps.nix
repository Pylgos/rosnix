{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-building-map-tools,
  ros2run,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_traffic_editor_test_maps";
  version = "1.9.2-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor_test_maps";
  nativeBuildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  buildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor_test_maps" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_test_maps-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "6ffe62c40797a73942ab82ebb0603953aabe082c";
        hash = "sha256-cgNMcGNhqTBVwLx/ohFW3mc63BhtT9UfGV95TzTih/w=";
      };
    };
  });
  meta = {
    description = "\n    Some test maps for traffic_editor and rmf_building_map_tools.\n  ";
  };
})
