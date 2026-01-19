{
  ament-cmake-core,
  ament-cmake-export-definitions,
  ament-cmake-export-dependencies,
  ament-cmake-export-include-directories,
  ament-cmake-export-interfaces,
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
  version = "2.5.5-1";
  src = finalAttrs.passthru.sources."ament_cmake";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-definitions ament-cmake-export-dependencies ament-cmake-export-include-directories ament-cmake-export-interfaces ament-cmake-export-libraries ament-cmake-export-link-flags ament-cmake-export-targets ament-cmake-gen-version-h ament-cmake-libraries ament-cmake-python ament-cmake-target-dependencies ament-cmake-test ament-cmake-version ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-definitions ament-cmake-export-dependencies ament-cmake-export-include-directories ament-cmake-export-interfaces ament-cmake-export-libraries ament-cmake-export-link-flags ament-cmake-export-targets ament-cmake-gen-version-h ament-cmake-libraries ament-cmake-python ament-cmake-target-dependencies ament-cmake-test ament-cmake-version ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake" = substituteSource {
      src = fetchgit {
        name = "ament_cmake-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "2778c269af7d050b272d17ea740f7608c1761e4d";
        hash = "sha256-3bmiowLl4WAk+b8X/qClD+yeTDOZb9oFH5H4bQjitmI=";
      };
    };
  });
  meta = {
    description = "The entry point package for the ament buildsystem in CMake.";
  };
})
