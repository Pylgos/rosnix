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
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_targets";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_targets" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_targets-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "deeb92d9f14f72f5d8529ce1b2e3f35b34aa86f7";
        hash = "sha256-Js5PVlhjBkpodeCXEO71PfXRRYqYh42v5Mn+MhoxwQw=";
      };
    };
  });
  meta = {
    description = "The ability to export targets to downstream packages in the ament buildsystem in CMake.";
  };
})
