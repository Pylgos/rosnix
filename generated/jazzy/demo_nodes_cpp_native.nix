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
  rmw_fastrtps_cpp,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    demo_nodes_cpp_native = substituteSource {
      src = fetchgit {
        name = "demo_nodes_cpp_native-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "9e72479129ef53e4e5f013d5943795c8fe21311e";
        hash = "sha256-6OGfQUe3IK7NAwCmoNS77930g1kvWGnlNhOfnGDEnMM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "demo_nodes_cpp_native";
  version = "0.33.4-1";
  src = sources.demo_nodes_cpp_native;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rmw_fastrtps_cpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake launch_testing_ros ];
  missingDependencies = [  ];
  meta = {
    description = "C++ nodes which access the native handles of the rmw implementation.";
  };
}
