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
  version = "1.9.1-1";
  src = finalAttrs.passthru.sources."rmf_building_map_tools";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python gz-fuel-tools-vendor rclpy rmf-building-map-msgs rmf-site-map-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-fiona" "python3-pyproj" "python3-requests" "python3-rtree" "python3-shapely" "sqlite3" "yaml-cpp" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_building_map_tools" = substituteSource {
      src = fetchgit {
        name = "rmf_building_map_tools-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "a6b0c09699bf074088d044d3d12641925b532289";
        hash = "sha256-4cUoJgBGbyqyS7tb68emxaWNBl+LdMnihmzy7xwvW90=";
      };
    };
  });
  meta = {
    description = "RMF Building map tools";
  };
})
