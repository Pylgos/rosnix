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
    examples_rclcpp_minimal_action_client-fddd31813cf15e39e787379c6669bd5f36a984f3 = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_action_client-fddd31813cf15e39e787379c6669bd5f36a984f3-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "fddd31813cf15e39e787379c6669bd5f36a984f3";
        hash = "sha256-44QoVGXKolZcxjZVubSNcgfDnEtRK2G4agpjaDy4x1M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_action_client";
  version = "0.19.4-1";
  src = sources.examples_rclcpp_minimal_action_client-fddd31813cf15e39e787379c6669bd5f36a984f3;
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
