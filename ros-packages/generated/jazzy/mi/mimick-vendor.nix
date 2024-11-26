{
  ament-cmake,
  ament-cmake-vendor-package,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mimick_vendor";
  version = "0.6.2-1";
  src = finalAttrs.passthru.sources."mimick_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mimick_vendor" = substituteSource {
      src = fetchgit {
        name = "mimick_vendor-source";
        url = "https://github.com/ros2-gbp/mimick_vendor-release.git";
        rev = "ec1c5a588d1ab270a3fdc76c142baeef167a34cd";
        hash = "sha256-Xr331CU6baKUiJO4PMtxhFW8eceLcNV4CWZLHGf0654=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/ros2/Mimick.git";
          to = "VCS_TYPE path VCS_URL ${sources."mimick_vendor/Mimick"}";
        }
      ];
    };
    "mimick_vendor/Mimick" = substituteSource {
      src = fetchgit {
        name = "Mimick-source";
        url = "https://github.com/ros2/Mimick.git";
        rev = "4dbd495e9f3d87a83c3201ef9d851e85f7133db7";
        hash = "sha256-4F3NiFxgwSOH1H5Njv0u78epF+jOzn7bUMcwuhRQznM=";
      };
    };
  });
  meta = {
    description = "Wrapper around mimick, it provides an ExternalProject build of mimick.";
  };
})
