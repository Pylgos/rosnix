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
    examples_rclcpp_minimal_subscriber = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_subscriber-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "a48397f134f23f265f147d6d6b5276d1722c462a";
        hash = "sha256-pT93WTImvBmy/zTtoxgl2Rl3VmDg73yJbpZLgtfO3f4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_subscriber";
  version = "0.20.2-1";
  src = sources.examples_rclcpp_minimal_subscriber;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Examples of minimal subscribers";
  };
}
