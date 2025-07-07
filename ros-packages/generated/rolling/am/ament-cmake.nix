{
  ament-cmake-core,
  ament-cmake-export-definitions,
  ament-cmake-export-dependencies,
  ament-cmake-export-include-directories,
  ament-cmake-export-libraries,
  ament-cmake-export-link-flags,
  ament-cmake-export-targets,
  ament-cmake-gen-version-h,
  ament-cmake-libraries,
  ament-cmake-python,
  ament-cmake-target-dependencies,
  ament-cmake-test,
  ament-cmake-version,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake";
  version = "2.8.4-1";
  src = finalAttrs.passthru.sources."ament_cmake";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-definitions ament-cmake-export-dependencies ament-cmake-export-include-directories ament-cmake-export-libraries ament-cmake-export-link-flags ament-cmake-export-targets ament-cmake-gen-version-h ament-cmake-libraries ament-cmake-python ament-cmake-target-dependencies ament-cmake-test ament-cmake-version ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-definitions ament-cmake-export-dependencies ament-cmake-export-include-directories ament-cmake-export-libraries ament-cmake-export-link-flags ament-cmake-export-targets ament-cmake-gen-version-h ament-cmake-libraries ament-cmake-python ament-cmake-target-dependencies ament-cmake-test ament-cmake-version ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake" = substituteSource {
      src = fetchgit {
        name = "ament_cmake-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "33a8a89c47006be23c1374f56b6a782d721651d7";
        hash = "sha256-XNKnBOuiOk0/eFRwS09zMLbio3dt7BIbLJMTxXCZc4E=";
      };
    };
  });
  meta = {
    description = "The entry point package for the ament buildsystem in CMake.";
  };
})
