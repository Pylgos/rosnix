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
  version = "0.15.3-1";
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
        rev = "6f68fae8e4f201fdfe79908286c6a54b80b1c5c0";
        hash = "sha256-3T5fHvwIwJgqW2UhTDrW0XH3d/ixQn7mGJDUNHXEpAc=";
      };
    };
  });
  meta = {
    description = "CMake macros to configure security";
  };
})
