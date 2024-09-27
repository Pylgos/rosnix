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
    rclcpp_action-9d4880075ab1018dbaefb8d47423202f01aa3070 = substituteSource {
      src = fetchgit {
        name = "rclcpp_action-9d4880075ab1018dbaefb8d47423202f01aa3070-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "9d4880075ab1018dbaefb8d47423202f01aa3070";
        hash = "sha256-l4IhMEhZ5SSBGLAckpIvCZx6hi/nnVVt74lPagfXd+s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_action";
  version = "28.3.3-1";
  src = sources.rclcpp_action-9d4880075ab1018dbaefb8d47423202f01aa3070;
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
