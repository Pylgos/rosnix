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
  version = "2.7.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_export_libraries";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_libraries" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_libraries-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "09c93ec9f53445f95dca38e957bbb5dcd65948a8";
        hash = "sha256-X7UiAaocAsEtPHHqopYhUUwMBodWzMOQADjeIExTs1A=";
      };
    };
  });
  meta = {
    description = "The ability to export libraries to downstream packages in the ament buildsystem in CMake.";
  };
})
