{
  ament-cmake-auto,
  ament-cmake-ros,
  autoware-cmake,
  autoware-map-msgs,
  autoware-planning-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lanelet2-core,
  lanelet2-io,
  lanelet2-maps,
  lanelet2-projection,
  lanelet2-routing,
  lanelet2-traffic-rules,
  lanelet2-validation,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_lanelet2_extension";
  version = "0.7.0-1";
  src = finalAttrs.passthru.sources."autoware_lanelet2_extension";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-map-msgs autoware-planning-msgs geometry-msgs lanelet2-core lanelet2-io lanelet2-maps lanelet2-projection lanelet2-routing lanelet2-traffic-rules lanelet2-validation rclcpp tf2 tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" "pugixml-dev" "range-v3" ]; };
  checkInputs = [ ament-cmake-ros ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_lanelet2_extension" = substituteSource {
      src = fetchgit {
        name = "autoware_lanelet2_extension-source";
        url = "https://github.com/ros2-gbp/autoware_lanelet2_extension-release.git";
        rev = "8633ce17b66a129d23876607b57437d3f30847c8";
        hash = "sha256-ERLxsYGRKFKE/NjYnkh0tnp1IHC8TcuQVZTQRWz5iag=";
      };
    };
  });
  meta = {
    description = "The autoware_lanelet2_extension package contains libraries to handle Lanelet2 format data.";
  };
})
