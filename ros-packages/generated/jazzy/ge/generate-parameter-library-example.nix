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
  version = "0.4.0-1";
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
        rev = "68ca334b3c10f50a467e89d05dacf602b82fdcf3";
        hash = "sha256-AqbWpFENP8cuzrdxAUJ73tKfkAQ5d23K+E6cMXy874g=";
      };
    };
  });
  meta = {
    description = "Example usage of generate_parameter_library.";
  };
})
