{
  ament-cmake,
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
  pname = "rmw_implementation_cmake";
  version = "7.9.1-1";
  src = finalAttrs.passthru.sources."rmw_implementation_cmake";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_implementation_cmake" = substituteSource {
      src = fetchgit {
        name = "rmw_implementation_cmake-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "44402e6a736ba2768e48cce06f95b18ad6dd955a";
        hash = "sha256-nwZD64JpVdXuUxwpZ/OiV7H5uyDJf+seXPDlXdRBL1c=";
      };
    };
  });
  meta = {
    description = "\n    CMake functions which can discover and enumerate available implementations.\n  ";
  };
})
