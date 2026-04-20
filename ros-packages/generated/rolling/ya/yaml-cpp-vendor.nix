{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yaml_cpp_vendor";
  version = "9.2.1-1";
  src = finalAttrs.passthru.sources."yaml_cpp_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yaml_cpp_vendor" = substituteSource {
      src = fetchgit {
        name = "yaml_cpp_vendor-source";
        url = "https://github.com/ros2-gbp/yaml_cpp_vendor-release.git";
        rev = "0550a4f6b523c79614de094fbb2d1adc090853d8";
        hash = "sha256-PzzAhvSk2kuP3XKEiGhNZVDeac5U7ktve3f+0aC+7ng=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around yaml-cpp, it provides a fixed CMake module and an ExternalProject build of it.\n  ";
  };
})
