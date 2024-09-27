{
  ament_cmake,
  ament_cmake_uncrustify,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rmf_traffic,
  rmf_traffic_msgs,
  rmf_traffic_ros2,
  rmf_utils,
  rmf_visualization_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  substituteSource,
  visualization_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "rmf_visualization_schedule" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_schedule-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "4aa4ddacce52315f98211824e219ce9c983b599d";
        hash = "sha256-2SvzpAD0Uei7K1eYXbcIRujC09Ra/c1aC/c6Ab59Yho=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf_visualization_schedule";
  version = "2.3.2-1";
  src = sources."rmf_visualization_schedule";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclcpp rclcpp_components rmf_traffic rmf_traffic_msgs rmf_traffic_ros2 rmf_visualization_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libboost-dev" "libssl-dev" "libwebsocketpp-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_uncrustify ament_lint_auto ament_lint_common rmf_utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A visualizer for trajectories in rmf schedule";
  };
}
