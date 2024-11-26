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
  pname = "ament_cmake_export_link_flags";
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_link_flags";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_export_link_flags" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_export_link_flags-source";
          url = "https://github.com/ros2-gbp/ament_cmake-release.git";
          rev = "26164116dba9528564491a2306c028de5deaf2e0";
          hash = "sha256-L4vZ/38CUBs1D9vWG9fAu4fxKQMP1WKVkC5p7PPo2ME=";
        };
      };
    });
  };
  meta = {
    description = "The ability to export link flags to downstream packages in the ament buildsystem.";
  };
})
