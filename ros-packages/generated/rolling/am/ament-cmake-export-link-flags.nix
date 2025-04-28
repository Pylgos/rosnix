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
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_link_flags";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_link_flags" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_link_flags-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "1448a14ea3d5aee35980468357eb6a0152ae1896";
        hash = "sha256-MD1n1vb/XHCP/poqE3ulS6Ff0BBvo8MVvjtGl/1eDKU=";
      };
    };
  });
  meta = {
    description = "The ability to export link flags to downstream packages in the ament buildsystem.";
  };
})
