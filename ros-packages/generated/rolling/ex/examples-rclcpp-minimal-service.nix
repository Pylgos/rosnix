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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_minimal_service";
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_service";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_service" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_service-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "7dc1fdbadf826ec7a736283ef1a0484330a5cc6f";
        hash = "sha256-F9PllQAMS3id3NQBk0Y0fDqyuUokSdfcXlCCpEqxWx4=";
      };
    };
  });
  meta = {
    description = "A minimal service server which adds two numbers";
  };
})
