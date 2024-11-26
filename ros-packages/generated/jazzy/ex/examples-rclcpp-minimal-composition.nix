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
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_composition";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_rclcpp_minimal_composition" = substituteSource {
        src = fetchgit {
          name = "examples_rclcpp_minimal_composition-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "403504eef1104799cb560b86188f34d8b70a46d9";
          hash = "sha256-dPfMx29eNlCzMVbVDpm3hllPIEIen7qj4TVdvzxzxws=";
        };
      };
    });
  };
  meta = {
    description = "Minimalist examples of composing nodes in the same process";
  };
})
