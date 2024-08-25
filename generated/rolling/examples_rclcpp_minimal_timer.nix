{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_timer = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_timer-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "4d089066984274be01975880acca289bd7dad629";
        hash = "sha256-3UBR+hlH3QZ4iuLsvslqoZuTKw54gPtuGA7gLv3ouEU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_timer";
  version = "0.20.2-1";
  src = sources.examples_rclcpp_minimal_timer;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Examples of minimal nodes which have timers";
  };
}
