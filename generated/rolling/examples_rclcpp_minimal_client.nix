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
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_client = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "6fad09dc532a16635534a5e2ea3521bcc164502b";
        hash = "sha256-3o7Fk3/L9pCPk6zd6TkcqimQ/GuiZH6JwRSpWn4NvR0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_client";
  version = "0.20.2-1";
  src = sources.examples_rclcpp_minimal_client;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Examples of minimal service clients";
  };
}
