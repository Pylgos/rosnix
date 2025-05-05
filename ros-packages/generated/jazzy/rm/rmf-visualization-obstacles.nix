{
  ament-cmake,
  ament-cmake-uncrustify,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rmf-obstacle-msgs,
  rmf-utils,
  rmf-visualization-msgs,
  rosSystemPackages,
  substituteSource,
  vision-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_visualization_obstacles";
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."rmf_visualization_obstacles";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp rclcpp-components rmf-obstacle-msgs rmf-visualization-msgs vision-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rclcpp-components rmf-obstacle-msgs rmf-visualization-msgs vision-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-uncrustify rmf-utils ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization_obstacles" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_obstacles-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "ea5997876c9e316df71b29cb446ba5299b768c7c";
        hash = "sha256-Cu1rClmXAp3Zuzc5DhsHEau7XqrwfIKFKHXhFHYXU0U=";
      };
    };
  });
  meta = {
    description = "A visualizer for obstacles in RMF";
  };
})
