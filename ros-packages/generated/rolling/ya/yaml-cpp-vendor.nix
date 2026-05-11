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
  version = "9.3.0-1";
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
        rev = "3cc320e150a88047e1dcbb53b13c5389749cb24e";
        hash = "sha256-qrord+1CRyfkDSz/jCZHtK9EZqA2Qx7k2qCzrvMOjW0=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around yaml-cpp, it provides a fixed CMake module and an ExternalProject build of it.\n  ";
  };
})
