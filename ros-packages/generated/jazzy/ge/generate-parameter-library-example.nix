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
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."generate_parameter_library_example";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core generate-parameter-library rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-core generate-parameter-library rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "generate_parameter_library_example" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library_example-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "6c7f81286394c80998b3fadcaf9353d4dbce08c7";
        hash = "sha256-vrn78pJn0uFPih2PRb/KzZ/wsYUhs1VSFde6QpGiXjA=";
      };
    };
  });
  meta = {
    description = "Example usage of generate_parameter_library.";
  };
})
