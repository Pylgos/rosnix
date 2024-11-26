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
  version = "0.13.2-1";
  src = finalAttrs.passthru.sources."sros2_cmake";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-test ];
  propagatedBuildInputs = [ ros2cli sros2 ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "sros2_cmake" = substituteSource {
        src = fetchgit {
          name = "sros2_cmake-source";
          url = "https://github.com/ros2-gbp/sros2-release.git";
          rev = "1a083aac5944c3e33072b5dd99adf8d9d1c3b076";
          hash = "sha256-Lk74feQcy27POAavf9+1v/TP/9b5J0tRA/mb7qTBdH0=";
        };
      };
    });
  };
  meta = {
    description = "CMake macros to configure security";
  };
})
