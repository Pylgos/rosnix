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
  version = "0.21.5-2";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_composition";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_composition" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_composition-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "60414fa3877639d6cc4d2df47fe94a11ed48ccf5";
        hash = "sha256-3C4jT2AnSPjec/kC7EREAugRabFj7klEyL9N2fs0IoQ=";
      };
    };
  });
  meta = {
    description = "Minimalist examples of composing nodes in the same\n  process";
  };
})
