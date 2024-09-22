{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_subscriber = substituteSource {
      src = fetchFromGitHub {
        name = "examples_rclcpp_minimal_subscriber-source";
        owner = "ros2-gbp";
        repo = "examples-release";
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
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Examples of minimal subscribers";
  };
}
