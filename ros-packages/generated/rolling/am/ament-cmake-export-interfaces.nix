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
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_interfaces";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_interfaces" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_interfaces-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "627da55c52f809a8f24214cf16766ccc04b63212";
        hash = "sha256-FvFPsYTu77m/Ntk6eLR2asQWmokwet8O3eisdm8SHBQ=";
      };
    };
  });
  meta = {
    description = "The ability to export interfaces to downstream packages in the ament buildsystem in CMake.";
  };
})
