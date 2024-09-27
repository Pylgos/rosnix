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
  sources = rec {
    rmf_visualization_schedule-347404c0b38dcdcb8e0dec289a85341560d77bdf = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_schedule-347404c0b38dcdcb8e0dec289a85341560d77bdf-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "347404c0b38dcdcb8e0dec289a85341560d77bdf";
        hash = "sha256-ZF0Jt3pX5RbjlWgJufsYS4sKto+XE38Dr6NGpijIVzg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_schedule";
  version = "2.4.0-1";
  src = sources.rmf_visualization_schedule-347404c0b38dcdcb8e0dec289a85341560d77bdf;
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
