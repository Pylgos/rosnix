{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing_ament_cmake,
  launch_testing_ros,
  rclcpp,
  rclcpp_lifecycle,
  robot_state_publisher,
  rosSystemPackages,
  rviz2,
  sensor_msgs,
  sick_safetyscanners2_interfaces,
  sick_safetyscanners_base,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    sick_safetyscanners2-96914d8dd6643a74aabae6292156b3aacaf790ca = substituteSource {
      src = fetchgit {
        name = "sick_safetyscanners2-96914d8dd6643a74aabae6292156b3aacaf790ca-source";
        url = "https://github.com/ros2-gbp/sick_safetyscanners2-release.git";
        rev = "96914d8dd6643a74aabae6292156b3aacaf790ca";
        hash = "sha256-DW09MAyJl2QfVunwcVkkufbRSONasFc8m8M5qpi9Dw8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safetyscanners2";
  version = "1.0.4-1";
  src = sources.sick_safetyscanners2-96914d8dd6643a74aabae6292156b3aacaf790ca;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_updater rclcpp rclcpp_lifecycle robot_state_publisher rviz2 sensor_msgs sick_safetyscanners2_interfaces sick_safetyscanners_base xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch_testing_ament_cmake launch_testing_ros xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-tools" ]; };
  meta = {
    description = "ROS2 Driver for the SICK safetyscanners";
  };
}
