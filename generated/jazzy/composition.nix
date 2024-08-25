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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    composition = substituteSource {
      src = fetchgit {
        name = "composition-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "deb73b233cbb746b766ab0c88cca5a9dfcffb3a1";
        hash = "sha256-khIarBBRLvdJsk/Our7rIOAIXGYcHOiIrufnZNQ1b/s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "composition";
  version = "0.33.4-1";
  src = sources.composition;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces launch_ros rclcpp rclcpp_components rcutils std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake launch_testing_ros rmw_implementation_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Examples for composing multiple nodes in a single process.";
  };
}
