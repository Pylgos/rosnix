{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
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
    examples_rclcpp_minimal_composition = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_composition-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "403504eef1104799cb560b86188f34d8b70a46d9";
        hash = "sha256-dPfMx29eNlCzMVbVDpm3hllPIEIen7qj4TVdvzxzxws=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_composition";
  version = "0.19.4-1";
  src = sources.examples_rclcpp_minimal_composition;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Minimalist examples of composing nodes in the same process";
  };
}
