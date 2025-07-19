{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "adaptive_component";
  version = "0.2.1-5";
  src = finalAttrs.passthru.sources."adaptive_component";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "adaptive_component" = substituteSource {
      src = fetchgit {
        name = "adaptive_component-source";
        url = "https://github.com/ros2-gbp/adaptive_component-release.git";
        rev = "c9f76c4da42aa4895a41fda1060911f4c02cce7e";
        hash = "sha256-W7/vGlSCfAW+RH7nsv4Po+MFZLDvwzuq/iSATbF9jaQ=";
      };
    };
  });
  meta = {
    description = "\n    A composable container for Adaptive ROS 2 Node computations.\n    Allows building Nodes that can select between FPGA, CPU or\n    GPU, at run-time. Stateless by default, can be made stateful\n    to meet use-case specific needs. Refer to examples in README.\n\n    Technically, provides A ROS 2 Node subclass programmed as a\n    \"Component\" and including its own single threaded executor\n    to build adaptive computations. Adaptive ROS 2 Nodes are able to\n    perform computations in the CPU, the FPGA or the GPU, adaptively.\n    Adaptive behavior is controlled through the \"adaptive\" ROS 2\n    parameter.\n  ";
  };
})
