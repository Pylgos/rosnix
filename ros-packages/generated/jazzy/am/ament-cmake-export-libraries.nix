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
  version = "2.5.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_export_libraries";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_libraries" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_libraries-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "e491e15b332e1fe109a5cfc3f7fb158b60351980";
        hash = "sha256-hyHKyrC0qCPmU61i5XbCz/A9iZ2EcUz6pBZSxa76gio=";
      };
    };
  });
  meta = {
    description = "The ability to export libraries to downstream packages in the ament buildsystem in CMake.";
  };
})
