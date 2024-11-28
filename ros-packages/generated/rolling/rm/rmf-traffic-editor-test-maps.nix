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
  version = "1.11.0-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor_test_maps";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ rmf-building-map-tools ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor_test_maps" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_test_maps-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "3056f6205fdd4590fdf1eba5acee594295c4b4a8";
        hash = "sha256-ult3QonQHoICOoYE6eX3ezuerImXxSFYd3RAht8kbYY=";
      };
    };
  });
  meta = {
    description = "Some test maps for traffic_editor and rmf_building_map_tools.";
  };
})
