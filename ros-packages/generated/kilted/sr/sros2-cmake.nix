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
  version = "0.15.4-1";
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
        rev = "2dbed0eb323e275bfe44bed58b16677a8575d4df";
        hash = "sha256-7dlizRo992evgw6oIE8ER9ROy2jLJH1bGNoSjKo2r00=";
      };
    };
  });
  meta = {
    description = "CMake macros to configure security";
  };
})
