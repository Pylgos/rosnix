{
  ament-cmake,
  ament-cmake-uncrustify,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "rmf_visualization_obstacles" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_obstacles-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "c75a9e1ed2868e34b13e8dffedd0bbd7e07ac56c";
        hash = "sha256-Zr/9GdPOB+2XnT7jgy9505tsIxS44QbsZHsqS0drSgM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf_visualization_obstacles";
  version = "2.4.0-1";
  src = sources."rmf_visualization_obstacles";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs rclcpp rclcpp-components rmf-obstacle-msgs rmf-visualization-msgs vision-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-uncrustify rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A visualizer for obstacles in RMF";
  };
}
