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
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_wait_set";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp rclcpp-components std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-components std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_wait_set" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_wait_set-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "686ebff76ab09f60e3f53089664dcc2040463e2c";
        hash = "sha256-U2tmLYKknpMz/MaQEjyDLchWbTQJEZN2Od5ngZP00Ng=";
      };
    };
  });
  meta = {
    description = "Example of how to use the rclcpp::WaitSet directly.";
  };
})
