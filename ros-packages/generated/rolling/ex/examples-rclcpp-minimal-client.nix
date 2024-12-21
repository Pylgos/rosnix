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
  pname = "examples_rclcpp_minimal_client";
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "63cb7920306daefed91c04bcfa80bf53803a9496";
        hash = "sha256-fim3keQODPnRxqZLAXb/jkLqIYYkSxHxfLrn2rNSE8Y=";
      };
    };
  });
  meta = {
    description = "Examples of minimal service clients";
  };
})
