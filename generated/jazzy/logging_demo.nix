{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  rclcpp,
  rclcpp_components,
  rcutils,
  rmw_implementation_cmake,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    logging_demo = substituteSource {
      src = fetchgit {
        name = "logging_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "0637cc57d07f827c4eb3415d9c1f5a60af3c4d54";
        hash = "sha256-CfJAEKfLBIjGGwjGRHUsmR35+Z2H1I2Gby0C4Hw+zi4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "logging_demo";
  version = "0.33.5-1";
  src = sources.logging_demo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rcutils rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake launch_testing_ros rmw_implementation_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Examples for using and configuring loggers.";
  };
}
