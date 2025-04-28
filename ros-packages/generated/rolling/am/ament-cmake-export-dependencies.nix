{
  ament-cmake-core,
  ament-cmake-libraries,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_export_dependencies";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_dependencies";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_dependencies" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "ed58dc33b1e6e0b8593155fd4101c44998e73daa";
        hash = "sha256-lYYq1xxP7LZDQWuV8B7+D0FN0VnBMGwt9ZaZ4JAwMKs=";
      };
    };
  });
  meta = {
    description = "The ability to export dependencies to downstream packages in the ament buildsystem in CMake.";
  };
})
