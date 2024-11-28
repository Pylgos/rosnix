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
  version = "1.11.0-1";
  src = finalAttrs.passthru.sources."rmf_building_map_tools";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python gz-fuel-tools-vendor rclpy rmf-building-map-msgs rmf-site-map-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-fiona" "python3-pyproj" "python3-requests" "python3-rtree" "python3-shapely" "sqlite3" "yaml-cpp" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_building_map_tools" = substituteSource {
      src = fetchgit {
        name = "rmf_building_map_tools-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "1e1cfd8c38a57029282a0a2261fb5fe5b6e19d23";
        hash = "sha256-IcP1NhVgHninkHUrpwliFo9KR4N4VKk3tJb3Frmwf/0=";
      };
    };
  });
  meta = {
    description = "RMF Building map tools";
  };
})
