{
  ament_cmake,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rmw_connextdds_common,
  substituteSource,
}:
let
  sources = rec {
    rmw_connextdds = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "c66b73f5ee1d30f38d77a8c9ce854754bd56ff1f";
        hash = "sha256-Jrjpk82Ee3GTqvyLSRQt/mMnMAxxBxQkcV27miew8cM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_connextdds";
  version = "0.22.0-2";
  src = sources.rmw_connextdds;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rmw_connextdds_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A ROS 2 RMW implementation built with RTI Connext DDS Professional.";
  };
}
