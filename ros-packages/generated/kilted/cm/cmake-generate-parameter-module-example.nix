{
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cmake_generate_parameter_module_example";
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."cmake_generate_parameter_module_example";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedNativeBuildInputs = [ generate-parameter-library rclpy ];
  buildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ generate-parameter-library rclpy ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cmake_generate_parameter_module_example" = substituteSource {
      src = fetchgit {
        name = "cmake_generate_parameter_module_example-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "b81e05609845b51ecb5fc413811dbc585e171cb6";
        hash = "sha256-IF1rzlHbuttmw22p8ByD6oLJIUDV9ka3hbzzNnp2W6o=";
      };
    };
  });
  meta = {
    description = "Example usage of generate_parameter_library for a python module with cmake.";
  };
})
