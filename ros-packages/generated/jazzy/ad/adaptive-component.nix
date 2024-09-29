{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "adaptive_component" = substituteSource {
      src = fetchgit {
        name = "adaptive_component-source";
        url = "https://github.com/ros2-gbp/adaptive_component-release.git";
        rev = "d9dd18ab639552e3a078a7ee900a99583d7368b7";
        hash = "sha256-W7/vGlSCfAW+RH7nsv4Po+MFZLDvwzuq/iSATbF9jaQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "adaptive-component";
  version = "0.2.1-5";
  src = sources."adaptive_component";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A composable container for Adaptive ROS 2 Node computations. Allows building Nodes that can select between FPGA, CPU or GPU, at run-time. Stateless by default, can be made stateful to meet use-case specific needs. Refer to examples in README. Technically, provides A ROS 2 Node subclass programmed as a \"Component\" and including its own single threaded executor to build adaptive computations. Adaptive ROS 2 Nodes are able to perform computations in the CPU, the FPGA or the GPU, adaptively. Adaptive behavior is controlled through the \"adaptive\" ROS 2 parameter.";
  };
}
