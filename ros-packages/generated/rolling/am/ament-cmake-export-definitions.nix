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
  pname = "ament_cmake_export_definitions";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_definitions";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_definitions" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_definitions-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "075ab3ebc7ec93bac7d85b32cd490a72f3ff8c9e";
        hash = "sha256-zcBTKfFMly5tyZYIARkt62LfROJa+mqvIi3lnpohGXI=";
      };
    };
  });
  meta = {
    description = "The ability to export definitions to downstream packages in the ament buildsystem.";
  };
})
