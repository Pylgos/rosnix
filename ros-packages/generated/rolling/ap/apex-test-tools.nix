{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-cmake-pclint,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "apex_test_tools";
  version = "0.0.2-8";
  src = finalAttrs.passthru.sources."apex_test_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ];
  propagatedNativeBuildInputs = [ ament-cmake-gtest ];
  propagatedBuildInputs = [ osrf-testing-tools-cpp ];
  checkInputs = [ ament-cmake-pclint ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "apex_test_tools" = substituteSource {
      src = fetchgit {
        name = "apex_test_tools-source";
        url = "https://github.com/ros2-gbp/apex_test_tools-release.git";
        rev = "4a87b1c634be29109bcf30218c6177c096fced98";
        hash = "sha256-vrX5LngYVt0Fxd0td4idUCVPg+j96W7S07zUG/lM8W4=";
      };
    };
  });
  meta = {
    description = "The package Apex.OS Test Tools contains test helpers";
  };
})
