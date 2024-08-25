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
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  opencv,
  rclcpp,
  rclcpp_components,
  rmw_implementation_cmake,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    image_tools = substituteSource {
      src = fetchgit {
        name = "image_tools-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "7a461988e06e8ac01725ac1523ac107c2285708a";
        hash = "sha256-Wx1h2ZpUb6m1aDvHk2zXs0DQNyZa74RlZBeOlL/Mz80=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_tools";
  version = "0.34.2-1";
  src = sources.image_tools;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ opencv rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_ros launch_testing launch_testing_ament_cmake launch_testing_ros rmw_implementation_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Tools to capture and play back images to and from DDS subscriptions and publications.";
  };
}
