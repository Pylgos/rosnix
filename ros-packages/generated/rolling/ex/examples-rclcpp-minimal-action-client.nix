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
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_action_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp rclcpp-action ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-action ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_action_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_action_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "8a08a4d51690fa52f8afe0bef0fe2ebbebb2dc1e";
        hash = "sha256-dD+HzvN7EGKjN06o4NoGCVJIA99rT/L4prBDTn1qKDE=";
      };
    };
  });
  meta = {
    description = "Minimal action client examples";
  };
})
