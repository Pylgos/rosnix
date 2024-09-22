{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  rsl,
  substituteSource,
  tcb_span,
  tl_expected,
}:
let
  sources = rec {
    parameter_traits = substituteSource {
      src = fetchgit {
        name = "parameter_traits-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "bf881491b34e30670849b57e5c49382c52c72b6d";
        hash = "sha256-tbkbI2Z5iOPtVMur4gJQVJQ+af59uhEZt7UNahBZ01I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "parameter_traits";
  version = "0.3.8-3";
  src = sources.parameter_traits;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rsl tcb_span tl_expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Functions and types for rclcpp::Parameter";
  };
}
