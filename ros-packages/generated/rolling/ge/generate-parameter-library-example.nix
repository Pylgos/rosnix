{
  ament-cmake,
  ament-cmake-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "generate_parameter_library_example";
  version = "0.3.9-1";
  src = finalAttrs.passthru.sources."generate_parameter_library_example";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ generate-parameter-library rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "generate_parameter_library_example" = substituteSource {
        src = fetchgit {
          name = "generate_parameter_library_example-source";
          url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
          rev = "80a3219b4055cdf797361d2f7c1de2024c1aa671";
          hash = "sha256-CpqS4EK2HsjeiB2K/twJ7DhEeY7hHHZJko98u5WhKos=";
        };
      };
    });
  };
  meta = {
    description = "Example usage of generate_parameter_library.";
  };
})
