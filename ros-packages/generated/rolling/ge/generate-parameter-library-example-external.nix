{
  ament-cmake,
  ament-cmake-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library-example,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "generate_parameter_library_example_external";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."generate_parameter_library_example_external";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core rclcpp ];
  propagatedBuildInputs = [ generate-parameter-library-example rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "generate_parameter_library_example_external" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library_example_external-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "310de35b1bcad540e8ca46573626d410872c02ec";
        hash = "sha256-H19OfQqnx4nRVbpEEhlDigvLKH9Q1SBkR1H3WMBUbWQ=";
      };
    };
  });
  meta = {
    description = "Example usage of a parameter header generated in another package.";
  };
})
