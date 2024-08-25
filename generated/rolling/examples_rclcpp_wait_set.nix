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
        rev = "1f72714321485792ba484c45ca723c37e32539da";
        hash = "sha256-4Wb1dvZ9WdSy5GmEA2O0hgMDtFTKu971rrhITxD0Zwc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_wait_set";
  version = "0.20.2-1";
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
