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
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_composition";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_composition" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_composition-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "c32bfb7776275bfa19ee4782012d8a2889312f3e";
        hash = "sha256-ejyyVP+B/BBrQNtpZ7Ng3B1Lnwb4tVWG1ynz64RqzUE=";
      };
    };
  });
  meta = {
    description = "Minimalist examples of composing nodes in the same process";
  };
})
