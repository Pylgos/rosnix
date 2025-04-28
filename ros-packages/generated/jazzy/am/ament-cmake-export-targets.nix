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
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_targets";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_targets" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_targets-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "116cc897468e72e4b54cfb854e17e768b4ef117e";
        hash = "sha256-Ll6XQOnbxB0nL5szXmyeXU9pbiu88vwObaj5aQY4zow=";
      };
    };
  });
  meta = {
    description = "The ability to export targets to downstream packages in the ament buildsystem in CMake.";
  };
})
