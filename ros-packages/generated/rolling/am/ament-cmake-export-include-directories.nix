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
  version = "2.7.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_export_include_directories";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_include_directories" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_include_directories-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "333e969ff0f2ea36bf05ec7f37e26b9112aeada4";
        hash = "sha256-BVWoI0PdUPKB/hLByF33VvM9gbnjnlUl1Qm0XSVexos=";
      };
    };
  });
  meta = {
    description = "The ability to export include directories to downstream packages in the ament buildsystem in CMake.";
  };
})
