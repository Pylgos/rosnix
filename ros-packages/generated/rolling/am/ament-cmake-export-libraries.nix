{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_export_libraries";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_libraries";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_libraries" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_libraries-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "2cf28c165ea9a98bf5f4ae151beb1affa04e493d";
        hash = "sha256-jZ5nJ2HKrBtd9RNWB3L5qiqG9XK9l2LHoHr0etVoPmM=";
      };
    };
  });
  meta = {
    description = "The ability to export libraries to downstream packages in the ament buildsystem in CMake.";
  };
})
