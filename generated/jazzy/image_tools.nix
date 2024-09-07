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
        rev = "e53f2dfe1be71d79d0cddf23b4e7f61bb33ba97d";
        hash = "sha256-hRy5xFGeKMfoRZT1Od8NONXd3wCtorOEaYHJCHMrUH4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_tools";
  version = "0.33.5-1";
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
