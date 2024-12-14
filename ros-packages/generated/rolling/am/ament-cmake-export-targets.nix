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
  version = "2.7.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_export_targets";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_targets" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_targets-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "7ae3b2299511501d528dcf613cc520e2cac64be0";
        hash = "sha256-EdOISZv939BGgho/xvFZUqVE0FMDqhjQMKlngM8x9WA=";
      };
    };
  });
  meta = {
    description = "The ability to export targets to downstream packages in the ament buildsystem in CMake.";
  };
})
