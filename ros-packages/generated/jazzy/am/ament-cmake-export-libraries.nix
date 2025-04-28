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
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_libraries";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_libraries" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_libraries-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "f074dfdc8468be83c6251085deb714f7a557c8e1";
        hash = "sha256-a67XkuvhQh0AJz2Nubr4hAKuVGFRCJ4cppy/ANrUeS4=";
      };
    };
  });
  meta = {
    description = "The ability to export libraries to downstream packages in the ament buildsystem in CMake.";
  };
})
