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
  pname = "examples_rclcpp_minimal_action_server";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_action_server";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-action ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_action_server" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_action_server-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "afc6fa81d44132e10e507fb1ced443ff8a6b9eea";
        hash = "sha256-qYAaj/GLdsU+3e4ZBiLXB151Kt2aFEEsuurI/4I4msU=";
      };
    };
  });
  meta = {
    description = "Minimal action server examples";
  };
})
