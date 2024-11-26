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
  rclcpp-action,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_minimal_action_client";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_action_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-action ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_action_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_action_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "fddd31813cf15e39e787379c6669bd5f36a984f3";
        hash = "sha256-44QoVGXKolZcxjZVubSNcgfDnEtRK2G4agpjaDy4x1M=";
      };
    };
  });
  meta = {
    description = "Minimal action client examples";
  };
})
