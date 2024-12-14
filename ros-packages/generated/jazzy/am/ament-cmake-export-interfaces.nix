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
  version = "2.5.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_export_interfaces";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_interfaces" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_interfaces-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "d9109d3879aa4a355d3bc2179ca36c312904de7a";
        hash = "sha256-sDA4rGTnnDRsk4XYW/+Y8jSyj2g7TYH504sBEHlP8Gc=";
      };
    };
  });
  meta = {
    description = "The ability to export interfaces to downstream packages in the ament buildsystem in CMake.";
  };
})
