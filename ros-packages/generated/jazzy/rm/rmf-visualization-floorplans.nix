{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rmf-building-map-msgs,
  rmf-utils,
  rmf-visualization-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_visualization_floorplans";
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."rmf_visualization_floorplans";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components rmf-building-map-msgs rmf-visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common rmf-utils ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_visualization_floorplans" = substituteSource {
        src = fetchgit {
          name = "rmf_visualization_floorplans-source";
          url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
          rev = "5543de571340f7c6d374ddb0fe404e17adcb0261";
          hash = "sha256-BxNcC59t9WO3W0PX0Rv+O/5chNuWk6lIDXqubQQLMBQ=";
        };
      };
    });
  };
  meta = {
    description = "A package to visualize the floorplans for levels in a building";
  };
})
