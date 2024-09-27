{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  rclcpp,
  rclcpp_components,
  rcutils,
  rmw_implementation_cmake,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    composition-7f05ecd2969c5de03f143c16abb5f7caf3d6cb53 = substituteSource {
      src = fetchgit {
        name = "composition-7f05ecd2969c5de03f143c16abb5f7caf3d6cb53-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "7f05ecd2969c5de03f143c16abb5f7caf3d6cb53";
        hash = "sha256-EmoAs308fc6SOrxxpKN2Stt3ik+gTPVxvhbAZLnw3cA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "composition";
  version = "0.33.5-1";
  src = sources.composition-7f05ecd2969c5de03f143c16abb5f7caf3d6cb53;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example_interfaces launch_ros rclcpp rclcpp_components rcutils std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake launch_testing_ros rmw_implementation_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Examples for composing multiple nodes in a single process.";
  };
}
