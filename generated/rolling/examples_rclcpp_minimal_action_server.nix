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
  rclcpp_action,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_action_server = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_action_server-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "652694d26f51cd4a01662f2a2110caf52a89c938";
        hash = "sha256-YJv56lie9JacXh0FeoeyjupxHl25cdeGkgTY7v8tFw8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_action_server";
  version = "0.20.2-1";
  src = sources.examples_rclcpp_minimal_action_server;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp rclcpp_action ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Minimal action server examples";
  };
}
