{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rmf_fleet_msgs,
  rmf_utils,
  rmf_visualization_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    rmf_visualization_fleet_states = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_fleet_states-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "1eb0b4f1bcda34147b95ba805fff5abaa05a635b";
        hash = "sha256-cRJbXpBi7w81AFyIbgfNZYmU5yfAG7GZla81mgGErVs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_fleet_states";
  version = "2.4.0-1";
  src = sources.rmf_visualization_fleet_states;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rmf_fleet_msgs rmf_visualization_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common rmf_utils ];
  missingDependencies = [  ];
  meta = {
    description = "A package to visualize positions of robots from different fleets in the a building";
  };
}
