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
  substituteSource,
}:
let
  sources = rec {
    adaptive_component-cea369fddf909c0d41112e9c498b90d7cd44c0de = substituteSource {
      src = fetchgit {
        name = "adaptive_component-cea369fddf909c0d41112e9c498b90d7cd44c0de-source";
        url = "https://github.com/ros2-gbp/adaptive_component-release.git";
        rev = "cea369fddf909c0d41112e9c498b90d7cd44c0de";
        hash = "sha256-W7/vGlSCfAW+RH7nsv4Po+MFZLDvwzuq/iSATbF9jaQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "adaptive_component";
  version = "0.2.1-4";
  src = sources.adaptive_component-cea369fddf909c0d41112e9c498b90d7cd44c0de;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A composable container for Adaptive ROS 2 Node computations. Allows building Nodes that can select between FPGA, CPU or GPU, at run-time. Stateless by default, can be made stateful to meet use-case specific needs. Refer to examples in README. Technically, provides A ROS 2 Node subclass programmed as a \"Component\" and including its own single threaded executor to build adaptive computations. Adaptive ROS 2 Nodes are able to perform computations in the CPU, the FPGA or the GPU, adaptively. Adaptive behavior is controlled through the \"adaptive\" ROS 2 parameter.";
  };
}
