{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rmf-building-map-msgs,
  rmf-fleet-msgs,
  rmf-traffic,
  rmf-traffic-ros2,
  rmf-utils,
  rmf-visualization-msgs,
  rosSystemPackages,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_visualization_navgraphs";
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."rmf_visualization_navgraphs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp rclcpp-components rmf-building-map-msgs rmf-fleet-msgs rmf-traffic rmf-traffic-ros2 rmf-visualization-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rclcpp-components rmf-building-map-msgs rmf-fleet-msgs rmf-traffic rmf-traffic-ros2 rmf-visualization-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common rmf-utils ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization_navgraphs" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_navgraphs-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "a44f3c6ea340b2553fca73bfdc3479144622de2e";
        hash = "sha256-coFTqFMSmrUt33zrW1bsByNPoZreYcXrB8aRqTZTldc=";
      };
    };
  });
  meta = {
    description = "A package to visualiize the navigation graphs of fleets";
  };
})
