{
  ament-index-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-fuel-tools-vendor,
  mkSourceSet,
  rclpy,
  rmf-building-map-msgs,
  rmf-site-map-msgs,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rmf_building_map_tools";
  version = "1.14.0-1";
  src = finalAttrs.passthru.sources."rmf_building_map_tools";
  propagatedNativeBuildInputs = [ ament-index-python gz-fuel-tools-vendor rclpy rmf-building-map-msgs rmf-site-map-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-fiona" "python3-pyproj" "python3-requests" "python3-rtree" "python3-shapely" "python3-yaml" "sqlite3" "yaml-cpp" ]; };
  propagatedBuildInputs = [ ament-index-python gz-fuel-tools-vendor rclpy rmf-building-map-msgs rmf-site-map-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-fiona" "python3-pyproj" "python3-requests" "python3-rtree" "python3-shapely" "python3-yaml" "sqlite3" "yaml-cpp" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_building_map_tools" = substituteSource {
      src = fetchgit {
        name = "rmf_building_map_tools-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "ac1dccf192637978cd9a1553942e60cdd46ccf3e";
        hash = "sha256-wOBTFM+6elwBJKn37cIHOVrkxubtoWPu2HJMVPuw16E=";
      };
    };
  });
  meta = {
    description = "RMF Building map tools";
  };
})
