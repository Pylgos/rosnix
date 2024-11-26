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
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_rclcpp_minimal_client" = substituteSource {
        src = fetchgit {
          name = "examples_rclcpp_minimal_client-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "c6b31483341b8084f64a89d91ed43d3f86963fa8";
          hash = "sha256-woQ1FHPCq2a21gXeyq6VcPjNO2LWpQehw8PZZgDaj3s=";
        };
      };
    });
  };
  meta = {
    description = "Examples of minimal service clients";
  };
})
