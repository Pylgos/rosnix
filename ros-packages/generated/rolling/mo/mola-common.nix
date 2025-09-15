{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
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
  pname = "mola_common";
  version = "0.5.1-2";
  src = finalAttrs.passthru.sources."mola_common";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint ros-environment ];
  buildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-xmllint ros-environment ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mola_common" = substituteSource {
      src = fetchgit {
        name = "mola_common-source";
        url = "https://github.com/ros2-gbp/mola_common-release.git";
        rev = "b645cbc4eadd0298d898b82d22fe4b8c12277cce";
        hash = "sha256-CZlPRrpOSKzCAQmqt+gY962ZSzCXdo0f5pGPhjnLovk=";
      };
    };
  });
  meta = {
    description = "Common CMake scripts to all MOLA modules";
  };
})
