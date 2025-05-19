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
  version = "2.4.2-1";
  src = finalAttrs.passthru.sources."rmf_visualization_floorplans";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components rmf-building-map-msgs rmf-visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libopencv-dev" ]; };
  buildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components rmf-building-map-msgs rmf-visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common rmf-utils ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization_floorplans" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_floorplans-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "52e164bb4ea4a260d4f2e038b0ca27ae723a0bf4";
        hash = "sha256-7z6tVXfzo/Fsh1g2kct+7bYGnWLY1kjvbO53h1cGQIY=";
      };
    };
  });
  meta = {
    description = "A package to visualize the floorplans for levels in a building";
  };
})
