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
  version = "0.3.9-1";
  src = finalAttrs.passthru.sources."cmake_generate_parameter_module_example";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ generate-parameter-library rclpy ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cmake_generate_parameter_module_example" = substituteSource {
      src = fetchgit {
        name = "cmake_generate_parameter_module_example-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "8b72ea233af26ab40a5620a129aefda8321ca30a";
        hash = "sha256-i6F2r51JSWVCPArP5W0ySLktAgv2RX1lb2qhI7qDt0A=";
      };
    };
  });
  meta = {
    description = "Example usage of generate_parameter_library for a python module with cmake.";
  };
})
