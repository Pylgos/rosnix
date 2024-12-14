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
  version = "2.5.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_export_include_directories";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_include_directories" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_include_directories-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "39ccb16c6e978223ca5d788d919a884b86f6ac40";
        hash = "sha256-smMbUeou3dpMhMS5gn+ZPqsO/wWZjHj9ZnZRNi9tJOQ=";
      };
    };
  });
  meta = {
    description = "The ability to export include directories to downstream packages in the ament buildsystem in CMake.";
  };
})
