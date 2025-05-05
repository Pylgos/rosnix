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
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_publisher";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "57c298f7509d4aeaf919e1d4b36a07c4b3398fd4";
        hash = "sha256-N9jsOCinec5fSv9aCR5I+pbD5r6sim/5JT2BwAs295g=";
      };
    };
  });
  meta = {
    description = "Examples of minimal publisher nodes";
  };
})
