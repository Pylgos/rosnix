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
    examples_rclcpp_minimal_action_server-afc6fa81d44132e10e507fb1ced443ff8a6b9eea = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_action_server-afc6fa81d44132e10e507fb1ced443ff8a6b9eea-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "afc6fa81d44132e10e507fb1ced443ff8a6b9eea";
        hash = "sha256-qYAaj/GLdsU+3e4ZBiLXB151Kt2aFEEsuurI/4I4msU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_action_server";
  version = "0.19.4-1";
  src = sources.examples_rclcpp_minimal_action_server-afc6fa81d44132e10e507fb1ced443ff8a6b9eea;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example_interfaces rclcpp rclcpp_action ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Minimal action server examples";
  };
}
