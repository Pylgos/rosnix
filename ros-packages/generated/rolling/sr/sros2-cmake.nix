{
  ament-cmake,
  ament-cmake-test,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2cli,
  rosSystemPackages,
  sros2,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sros2_cmake";
  version = "0.16.2-1";
  src = finalAttrs.passthru.sources."sros2_cmake";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-test ros2cli sros2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-test ros2cli sros2 ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "sros2_cmake" = substituteSource {
      src = fetchgit {
        name = "sros2_cmake-source";
        url = "https://github.com/ros2-gbp/sros2-release.git";
        rev = "7ca13bf52ca2b55fcc3cefc3f7b33722962e2ad9";
        hash = "sha256-NMUg7lt5xvnQWhNEAPB/m3fuwpT3iSNwNoP5kXjhnk8=";
      };
    };
  });
  meta = {
    description = "CMake macros to configure security";
  };
})
