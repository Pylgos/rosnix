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
        rev = "2efab9be76af3b788ee8f06a3f43fdf36bc71461";
        hash = "sha256-9fjvWKgKmVm0aaJXMzewXL5UMuZ3AboylZsjXk3BN4o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_publisher";
  version = "0.19.4-1";
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
