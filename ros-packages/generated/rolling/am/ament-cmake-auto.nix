{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_auto";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_auto";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ];
  propagatedBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_auto" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_auto-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "562d32e751d166a18a99f50a0078c96fe9bf34ff";
        hash = "sha256-Z2mwAuTma8WhMsWL97BUICKdSi3gVEZIg7B6lIl80ok=";
      };
    };
  });
  meta = {
    description = "The auto-magic functions for ease to use of the ament buildsystem in CMake.";
  };
})
