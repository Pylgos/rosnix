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
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_action_server";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-action ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_action_server" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_action_server-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "c4a313c4d463e480011475d1df44c93bacb3e04a";
        hash = "sha256-l2z4EXyKtJMrhnEAlXZftSBj7JCGgfWC28OMC9xc/bo=";
      };
    };
  });
  meta = {
    description = "Minimal action server examples";
  };
})
