{
  ament_cmake,
  ament_cmake_uncrustify,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  openssl,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rmf_traffic,
  rmf_traffic_msgs,
  rmf_traffic_ros2,
  rmf_utils,
  rmf_visualization_msgs,
  rosidl_default_generators,
  substituteSource,
  visualization_msgs,
  websocketpp,
}:
let
  sources = rec {
    rmf_visualization_schedule = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_schedule-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "4aa4ddacce52315f98211824e219ce9c983b599d";
        hash = "sha256-2SvzpAD0Uei7K1eYXbcIRujC09Ra/c1aC/c6Ab59Yho=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_schedule";
  version = "2.3.2-1";
  src = sources.rmf_visualization_schedule;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs openssl python3Packages.boost rclcpp rclcpp_components rmf_traffic rmf_traffic_msgs rmf_traffic_ros2 rmf_visualization_msgs visualization_msgs websocketpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_uncrustify ament_lint_auto ament_lint_common rmf_utils ];
  missingDependencies = [  ];
  meta = {
    description = "A visualizer for trajectories in rmf schedule";
  };
}
