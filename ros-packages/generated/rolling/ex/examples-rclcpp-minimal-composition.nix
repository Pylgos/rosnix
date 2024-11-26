{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "examples_rclcpp_minimal_composition";
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_composition";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_composition" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_composition-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "2ad42232998f983c0545842a8c7a0b581fd94351";
        hash = "sha256-/9GBCM09+gjgVHAiKv3QU6LiFYW9Jb+DTvRWeB31+2E=";
      };
    };
  });
  meta = {
    description = "Minimalist examples of composing nodes in the same process";
  };
})
