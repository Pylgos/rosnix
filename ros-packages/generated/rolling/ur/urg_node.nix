{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  laser_proc,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  rosidl_default_generators,
  sensor_msgs,
  std_srvs,
  substituteSource,
  urdf,
  urg_c,
  urg_node_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "urg_node" = substituteSource {
      src = fetchgit {
        name = "urg_node-source";
        url = "https://github.com/ros2-gbp/urg_node-release.git";
        rev = "ebab3358cbd4ace0a537f30cdc416dcd738e5837";
        hash = "sha256-hz6upepfbgI1ToUr7XupzHvWBA7oKZk4QZTKCZwbMRI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "urg_node";
  version = "1.1.1-3";
  src = sources."urg_node";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces diagnostic_updater laser_proc rclcpp rclcpp_components sensor_msgs std_srvs urdf urg_c urg_node_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "urg_node";
  };
}
