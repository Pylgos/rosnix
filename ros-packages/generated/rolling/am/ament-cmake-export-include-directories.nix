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
  pname = "ament_cmake_export_include_directories";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_include_directories";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_include_directories" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_include_directories-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "74b07b023f953723763912dc674b442e2a2d7975";
        hash = "sha256-ZsQ88SHGH4388qUfztbnOKwQidZYjwX2Ijz6wAgAOhE=";
      };
    };
  });
  meta = {
    description = "The ability to export include directories to downstream packages in the ament buildsystem in CMake.";
  };
})
