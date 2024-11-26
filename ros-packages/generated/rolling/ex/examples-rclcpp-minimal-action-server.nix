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
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_action_server";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-action ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_action_server" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_action_server-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "d66d8c8a1096194e935e26f010fa6f88d8261c5d";
        hash = "sha256-gsNOLixABdW/PNIwVX/MV+oqvWgWzjyxLLMIazjA/Ec=";
      };
    };
  });
  meta = {
    description = "Minimal action server examples";
  };
})
