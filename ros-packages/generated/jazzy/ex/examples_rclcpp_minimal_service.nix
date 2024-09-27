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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_service-7608f6207925ceaec3e0ad3a65d7e1a5cbbd663f = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_service-7608f6207925ceaec3e0ad3a65d7e1a5cbbd663f-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "7608f6207925ceaec3e0ad3a65d7e1a5cbbd663f";
        hash = "sha256-TK40aRRYWs3kQbrTRrkP0Hpjoez1wQ+pxCXkq44ckFE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_service";
  version = "0.19.4-1";
  src = sources.examples_rclcpp_minimal_service-7608f6207925ceaec3e0ad3a65d7e1a5cbbd663f;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example_interfaces rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A minimal service server which adds two numbers";
  };
}
