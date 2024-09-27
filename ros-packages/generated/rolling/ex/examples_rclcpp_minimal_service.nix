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
    examples_rclcpp_minimal_service-30da3f768f4dc6c706492ecf77893721b69b6db0 = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_service-30da3f768f4dc6c706492ecf77893721b69b6db0-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "30da3f768f4dc6c706492ecf77893721b69b6db0";
        hash = "sha256-lsg3N2eEn1VMeUsxb7zgP5xWkMhNPY5A43V53Ybargg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_service";
  version = "0.20.2-1";
  src = sources.examples_rclcpp_minimal_service-30da3f768f4dc6c706492ecf77893721b69b6db0;
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
