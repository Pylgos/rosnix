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
  version = "1.9.2-1";
  src = finalAttrs.passthru.sources."rmf_building_map_tools";
  propagatedNativeBuildInputs = [ ament-index-python gz-fuel-tools-vendor rclpy rmf-building-map-msgs rmf-site-map-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-fiona" "python3-pyproj" "python3-requests" "python3-rtree" "python3-shapely" "python3-yaml" "sqlite3" "yaml-cpp" ]; };
  propagatedBuildInputs = [ ament-index-python gz-fuel-tools-vendor rclpy rmf-building-map-msgs rmf-site-map-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-fiona" "python3-pyproj" "python3-requests" "python3-rtree" "python3-shapely" "python3-yaml" "sqlite3" "yaml-cpp" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_building_map_tools" = substituteSource {
      src = fetchgit {
        name = "rmf_building_map_tools-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "436dbc6b552816d05cb933e6d8ac5e89fa20e6d0";
        hash = "sha256-tqXQzat7JguwIkQXd/VnL2G7z7ULy9AIGCcq62o9b7k=";
      };
    };
  });
  meta = {
    description = "RMF Building map tools";
  };
})
