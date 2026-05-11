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
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_link_flags";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_link_flags" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_link_flags-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "e9babdba3120196dd0033567cf6e4158d36b9671";
        hash = "sha256-VDL9srio2yHP5nKgr/4+74Jr7NBeqQ/lJZknNnwb274=";
      };
    };
  });
  meta = {
    description = "The ability to export link flags to downstream packages in the ament buildsystem.";
  };
})
