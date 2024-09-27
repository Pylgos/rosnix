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
    examples_rclcpp_minimal_action_server-652694d26f51cd4a01662f2a2110caf52a89c938 = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_action_server-652694d26f51cd4a01662f2a2110caf52a89c938-source";
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
  src = sources.examples_rclcpp_minimal_action_server-652694d26f51cd4a01662f2a2110caf52a89c938;
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
