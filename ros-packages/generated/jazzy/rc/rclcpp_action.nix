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
  rosSystemPackages,
  rosidl_runtime_c,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rclcpp_action-beccbe56c6180ed32d6eb0062099e8e238fa585f = substituteSource {
      src = fetchgit {
        name = "rclcpp_action-beccbe56c6180ed32d6eb0062099e8e238fa585f-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "beccbe56c6180ed32d6eb0062099e8e238fa585f";
        hash = "sha256-ANnYhYXfDfNXuNjWCHyetQp0s8OV7bX50bN7sfqqLE4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_action";
  version = "28.1.5-1";
  src = sources.rclcpp_action-beccbe56c6180ed32d6eb0062099e8e238fa585f;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_msgs rcl rcl_action rclcpp rcpputils rosidl_runtime_c ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common mimick_vendor performance_test_fixture test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Adds action APIs for C++.";
  };
}
