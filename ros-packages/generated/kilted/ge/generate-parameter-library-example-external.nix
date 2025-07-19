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
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."generate_parameter_library_example_external";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core generate-parameter-library-example rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-core generate-parameter-library-example rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "generate_parameter_library_example_external" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library_example_external-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "9fbc38ddc13473483b877bd2b928371ae090eaa8";
        hash = "sha256-8gBSybEYV8TzmHgUPJA8/QNtPXQSWFijGf9FFE3Aeig=";
      };
    };
  });
  meta = {
    description = "Example usage of a parameter header generated in another package.";
  };
})
