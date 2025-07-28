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
  version = "1.14.0-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor_test_maps";
  nativeBuildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  buildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor_test_maps" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_test_maps-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "dabb5b06eb3d99dd5a989da11ce9f9a7e79e9dd2";
        hash = "sha256-iJDHccFiNGWnY37wPeF9bAjxC556iDfvvdUOonqqVGs=";
      };
    };
  });
  meta = {
    description = "\n    Some test maps for traffic_editor and rmf_building_map_tools.\n  ";
  };
})
