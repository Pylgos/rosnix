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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_action_client-229eb5890f955b79fe6673cf2a3ca47776579cbf = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_action_client-229eb5890f955b79fe6673cf2a3ca47776579cbf-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "229eb5890f955b79fe6673cf2a3ca47776579cbf";
        hash = "sha256-urApvi823Y+a0Eigg1DWXkVL21zJUUDSVs9McEPhZT4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_action_client";
  version = "0.20.2-1";
  src = sources.examples_rclcpp_minimal_action_client-229eb5890f955b79fe6673cf2a3ca47776579cbf;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example_interfaces rclcpp rclcpp_action ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Minimal action client examples";
  };
}
