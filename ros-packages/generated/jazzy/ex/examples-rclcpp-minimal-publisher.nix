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
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_minimal_publisher";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_publisher";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "2efab9be76af3b788ee8f06a3f43fdf36bc71461";
        hash = "sha256-9fjvWKgKmVm0aaJXMzewXL5UMuZ3AboylZsjXk3BN4o=";
      };
    };
  });
  meta = {
    description = "Examples of minimal publisher nodes";
  };
})
