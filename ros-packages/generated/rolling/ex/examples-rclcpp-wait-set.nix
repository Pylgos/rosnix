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
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_wait_set";
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_wait_set";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-components std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_wait_set" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_wait_set-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "7fe72b7358059f77dbdba6257ec174f66151a224";
        hash = "sha256-vyieWvyvMQp43KuZlnR3gCPk9yyU4WokCNV7/vZIGb8=";
      };
    };
  });
  meta = {
    description = "Example of how to use the rclcpp::WaitSet directly.";
  };
})
