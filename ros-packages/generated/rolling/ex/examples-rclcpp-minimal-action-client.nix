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
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_action_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-action ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_rclcpp_minimal_action_client" = substituteSource {
        src = fetchgit {
          name = "examples_rclcpp_minimal_action_client-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "efd94afe996cb5643f141ff9ddef2eaabeba6f66";
          hash = "sha256-L2J/czvbZ86z5ooUnZOS5kOwU+nNpwu6lqejoSQ8uaE=";
        };
      };
    });
  };
  meta = {
    description = "Minimal action client examples";
  };
})
