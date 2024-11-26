{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_wait_set";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_wait_set";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-components std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_rclcpp_wait_set" = substituteSource {
        src = fetchgit {
          name = "examples_rclcpp_wait_set-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "07cecbcdc765f817583332f6cd674f5dc462b940";
          hash = "sha256-bcYdoXpGb2pdK56zFdit4yfNtigRFiQbZP3GfWVr9JQ=";
        };
      };
    });
  };
  meta = {
    description = "Example of how to use the rclcpp::WaitSet directly.";
  };
})
