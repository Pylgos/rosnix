{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt_libmaps,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mola_metric_maps = substituteSource {
      src = fetchgit {
        name = "mola_metric_maps-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "2817fd0be0dbc8038227495938d8418bffee1826";
        hash = "sha256-7HylO2OCw5zRpSouIbXot54NjU/TUyiD6bgYOQcyMFA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_metric_maps";
  version = "1.1.3-1";
  src = sources.mola_metric_maps;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt_libmaps ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Advanced metric map classes, using the generic `mrpt::maps::CMetricMap` interface, for use in other MOLA odometry and SLAM modules.";
  };
}
