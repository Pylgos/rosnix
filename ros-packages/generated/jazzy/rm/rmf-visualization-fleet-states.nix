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
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."rmf_visualization_fleet_states";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components rmf-fleet-msgs rmf-visualization-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rmf-fleet-msgs rmf-visualization-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common rmf-utils ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization_fleet_states" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_fleet_states-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "9946b5947d41a77654c9740630532215f888f8ea";
        hash = "sha256-/OUN3LLuQOV7jZ7wDvSaySMVfCHoeErt7GxHZdSUd9c=";
      };
    };
  });
  meta = {
    description = "A package to visualize positions of robots from different fleets in the a building";
  };
})
