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
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."cmake_generate_parameter_module_example";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ generate-parameter-library rclpy ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cmake_generate_parameter_module_example" = substituteSource {
      src = fetchgit {
        name = "cmake_generate_parameter_module_example-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "b969357b6b390bbd2ef8b77fd127d52483d49147";
        hash = "sha256-sSzRlhJA3ZPAy8yJZarzHp50VlVrOC/d6Q2QloAK5SA=";
      };
    };
  });
  meta = {
    description = "Example usage of generate_parameter_library for a python module with cmake.";
  };
})
