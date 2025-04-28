{
  ament-cmake-core,
  ament-cmake-libraries,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_export_dependencies";
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_dependencies";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_dependencies" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "1f4afc3a727f264beff9b4d16b68e7b56a7f2aca";
        hash = "sha256-QD9Y8JP16QAau1npcn+AULQM7YtBlECd9qMSaXLwfMI=";
      };
    };
  });
  meta = {
    description = "The ability to export dependencies to downstream packages in the ament buildsystem in CMake.";
  };
})
