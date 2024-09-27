{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_multithreaded_executor-198bc59389c12b3dcd106d51cacdc722d6afb5d2 = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_multithreaded_executor-198bc59389c12b3dcd106d51cacdc722d6afb5d2-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "198bc59389c12b3dcd106d51cacdc722d6afb5d2";
        hash = "sha256-U2cq59Pmhxel0vHc1C8RuXzQJTZ5k/qKW1Hi9lVIauc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_multithreaded_executor";
  version = "0.19.4-1";
  src = sources.examples_rclcpp_multithreaded_executor-198bc59389c12b3dcd106d51cacdc722d6afb5d2;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package containing example of how to implement a multithreaded executor";
  };
}
