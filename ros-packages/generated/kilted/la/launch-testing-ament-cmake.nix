{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "launch_testing_ament_cmake";
  version = "3.8.4-1";
  src = finalAttrs.passthru.sources."launch_testing_ament_cmake";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-test launch-testing ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-test launch-testing ];
  checkInputs = [ ament-cmake-copyright launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "launch_testing_ament_cmake" = substituteSource {
      src = fetchgit {
        name = "launch_testing_ament_cmake-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "f4b1c67f526162be3a1378cff73c03cd8c33ed79";
        hash = "sha256-Jq09zagiwJ/zl/CZagfM15cF6WnqovpcFS2WKII54QY=";
      };
    };
  });
  meta = {
    description = "A package providing cmake functions for running launch tests from the build.";
  };
})
