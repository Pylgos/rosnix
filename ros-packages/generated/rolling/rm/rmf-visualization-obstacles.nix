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
  version = "2.4.1-1";
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
        rev = "fa60cf3593ad5963a7d56ca52353788a37e30eec";
        hash = "sha256-yER0pzCDq8dnmdwHlZdRDqc4Fo4UJbbvbivA4ijJ1xE=";
      };
    };
  });
  meta = {
    description = "A visualizer for obstacles in RMF";
  };
})
