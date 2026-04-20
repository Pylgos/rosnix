{
  ament-cmake-gtest,
  ament-lint-auto,
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_core_common";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_core_common";
  nativeBuildInputs = [ autoware-cmake ros-environment ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "nlohmann-json-dev" ]; };
  buildInputs = [ autoware-cmake ros-environment ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_core_common" = substituteSource {
      src = fetchgit {
        name = "nebula_core_common-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "0711a47a1ef08b8874bd85b9a2fc7c5db627b39c";
        hash = "sha256-3u8gHLN6DP1DTmOMOrzim4TzS5uAHNsHLCozs9SqjNQ=";
      };
    };
  });
  meta = {
    description = "Nebula Common Base Libraries and headers";
  };
})
