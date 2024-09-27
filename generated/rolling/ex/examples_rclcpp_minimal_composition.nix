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
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_composition-57e117a6f3abab42731451a1caf69efe7406e5bb = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_composition-57e117a6f3abab42731451a1caf69efe7406e5bb-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "57e117a6f3abab42731451a1caf69efe7406e5bb";
        hash = "sha256-8PFSuIsF6vGmJAw1abfN/iDCDDPbqeekh6otF+tXZFs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_composition";
  version = "0.20.2-1";
  src = sources.examples_rclcpp_minimal_composition-57e117a6f3abab42731451a1caf69efe7406e5bb;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Minimalist examples of composing nodes in the same process";
  };
}
