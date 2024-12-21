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
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_wait_set";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-components std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_wait_set" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_wait_set-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "f4da5e1e45bb25ffbaec4b4aef9d2c218d1e4ccd";
        hash = "sha256-WZkLG3LxZkd7NZysLMBM24+lcrkErAupu74rsS5qr8g=";
      };
    };
  });
  meta = {
    description = "Example of how to use the rclcpp::WaitSet directly.";
  };
})
