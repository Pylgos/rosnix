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
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_include_directories";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_include_directories" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_include_directories-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "ee1fface5ae561a47743159a87f0f9cb5b440996";
        hash = "sha256-KJ3ctrXre5o60GsqJLoJ+X+vC/Y5a1oFWNwlwtGbvu8=";
      };
    };
  });
  meta = {
    description = "The ability to export include directories to downstream packages in the ament buildsystem in CMake.";
  };
})
