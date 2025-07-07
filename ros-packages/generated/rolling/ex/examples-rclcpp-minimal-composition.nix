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
  version = "0.21.1-1";
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
        rev = "a753491617abbad60cd6f76388cbf9aa3f29eff4";
        hash = "sha256-eZ4df/IuBLHVXMjdvBoP11CykbDqliAWkQ+NtOl1Zfw=";
      };
    };
  });
  meta = {
    description = "Minimalist examples of composing nodes in the same\n  process";
  };
})
