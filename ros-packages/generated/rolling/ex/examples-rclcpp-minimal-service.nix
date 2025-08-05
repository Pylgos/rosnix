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
  version = "0.21.2-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_service";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_service" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_service-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "3bbb63cc3a30b137bdf59741c0389da2937a0cee";
        hash = "sha256-r4yTHOhSx0O31mO/EUueZ8YyJNYvO3T4VVBVYzLPawM=";
      };
    };
  });
  meta = {
    description = "A minimal service server which adds two numbers";
  };
})
