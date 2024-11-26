{
  ament-cmake-core,
  ament-cmake-export-libraries,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_export_targets";
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_targets";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_targets" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_targets-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "dcaa38d516d29973f49a59b2be92806d4d556b1d";
        hash = "sha256-EdOISZv939BGgho/xvFZUqVE0FMDqhjQMKlngM8x9WA=";
      };
    };
  });
  meta = {
    description = "The ability to export targets to downstream packages in the ament buildsystem in CMake.";
  };
})
