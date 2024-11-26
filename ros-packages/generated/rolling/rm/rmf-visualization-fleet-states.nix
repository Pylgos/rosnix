{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rmf-fleet-msgs,
  rmf-utils,
  rmf-visualization-msgs,
  rosSystemPackages,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_visualization_fleet_states";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."rmf_visualization_fleet_states";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rmf-fleet-msgs rmf-visualization-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common rmf-utils ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_visualization_fleet_states" = substituteSource {
        src = fetchgit {
          name = "rmf_visualization_fleet_states-source";
          url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
          rev = "1eb0b4f1bcda34147b95ba805fff5abaa05a635b";
          hash = "sha256-cRJbXpBi7w81AFyIbgfNZYmU5yfAG7GZla81mgGErVs=";
        };
      };
    });
  };
  meta = {
    description = "A package to visualize positions of robots from different fleets in the a building";
  };
})
