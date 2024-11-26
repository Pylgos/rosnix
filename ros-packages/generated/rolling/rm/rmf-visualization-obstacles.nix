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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."rmf_visualization_obstacles";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rclcpp-components rmf-obstacle-msgs rmf-visualization-msgs vision-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-uncrustify rmf-utils ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization_obstacles" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_obstacles-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "c75a9e1ed2868e34b13e8dffedd0bbd7e07ac56c";
        hash = "sha256-Zr/9GdPOB+2XnT7jgy9505tsIxS44QbsZHsqS0drSgM=";
      };
    };
  });
  meta = {
    description = "A visualizer for obstacles in RMF";
  };
})
