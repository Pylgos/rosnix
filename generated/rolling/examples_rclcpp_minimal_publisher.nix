{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_publisher = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "c77fcc17b7d033739f276269aecff00eea47dedb";
        hash = "sha256-7x1ngsij9jIsGK24JrfCObKnFzuGKRVZfoQC3VagGQM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_publisher";
  version = "0.20.2-1";
  src = sources.examples_rclcpp_minimal_publisher;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Examples of minimal publisher nodes";
  };
}
