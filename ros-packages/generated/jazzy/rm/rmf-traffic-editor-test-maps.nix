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
  version = "1.9.1-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor_test_maps";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ rmf-building-map-tools ros2run ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_traffic_editor_test_maps" = substituteSource {
        src = fetchgit {
          name = "rmf_traffic_editor_test_maps-source";
          url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
          rev = "0cae53184649ffa92ff7f95414420d400f872d35";
          hash = "sha256-+CyU4MrWaOGPsEtm5SXBONfFEeg5kLfRAu+zuSx4nbo=";
        };
      };
    });
  };
  meta = {
    description = "Some test maps for traffic_editor and rmf_building_map_tools.";
  };
})
