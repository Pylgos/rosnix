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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_minimal_service";
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_service";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_rclcpp_minimal_service" = substituteSource {
        src = fetchgit {
          name = "examples_rclcpp_minimal_service-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "cc0595c09abe2f7b2126358a3bc79699af253c45";
          hash = "sha256-2QPJ63ALFSE0AMBaQzfnRkEOGssLkHUrDSnze8Rzejs=";
        };
      };
    });
  };
  meta = {
    description = "A minimal service server which adds two numbers";
  };
})
