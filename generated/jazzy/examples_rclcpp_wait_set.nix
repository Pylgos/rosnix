{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_wait_set = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_wait_set-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "07cecbcdc765f817583332f6cd674f5dc462b940";
        hash = "sha256-bcYdoXpGb2pdK56zFdit4yfNtigRFiQbZP3GfWVr9JQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_wait_set";
  version = "0.19.4-1";
  src = sources.examples_rclcpp_wait_set;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Example of how to use the rclcpp::WaitSet directly.";
  };
}
