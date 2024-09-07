{
  action_msgs,
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mimick_vendor,
  performance_test_fixture,
  rcl,
  rcl_action,
  rclcpp,
  rcpputils,
  rosidl_runtime_c,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rclcpp_action = substituteSource {
      src = fetchgit {
        name = "rclcpp_action-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "895a18b1204f1c8712e8eb219ada7ea2226d805b";
        hash = "sha256-mvRkadTkDWqY1GaHFC/hsCQN5LfVSUiu388umAC6/64=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_action";
  version = "28.1.4-1";
  src = sources.rclcpp_action;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rcl rcl_action rclcpp rcpputils rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common mimick_vendor performance_test_fixture test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Adds action APIs for C++.";
  };
}
