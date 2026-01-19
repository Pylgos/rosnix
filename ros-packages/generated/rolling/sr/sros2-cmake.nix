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
  version = "0.16.3-1";
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
        rev = "83ea8f7afd30fa2020cbe84dd1b76eab0c5f65ee";
        hash = "sha256-EHHENrlY7+TxhIweDLdH6t+z06udYVWg2UcC5ZSr09U=";
      };
    };
  });
  meta = {
    description = "CMake macros to configure security";
  };
})
