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
  pname = "ament_cmake_export_interfaces";
  version = "2.7.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_export_interfaces";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_interfaces" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_interfaces-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "aa3939a2fd73c8b1087ee3348ac4fef40deb304b";
        hash = "sha256-vglDEy/EOedm0uggWvpECsJK8DMPPHdJn2fsGWpoguY=";
      };
    };
  });
  meta = {
    description = "The ability to export interfaces to downstream packages in the ament buildsystem in CMake.";
  };
})
