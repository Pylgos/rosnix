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
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_action_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-action ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_action_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_action_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "fd2a80c6c351bf20734ba743541afe6e53dfcdfa";
        hash = "sha256-RRN/f8xtvoUdxIc1Dbvki2y3ghaEOhZGOyPe/PyiGsU=";
      };
    };
  });
  meta = {
    description = "Minimal action client examples";
  };
})
