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
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_interfaces";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_interfaces" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_interfaces-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "fbf79b5599ec2f70f2a1744d5fefb6ae0df90423";
        hash = "sha256-HeywaAEBGDTT4N5pIYLVAE3ZmXAPeEtC+QN5eckyLzM=";
      };
    };
  });
  meta = {
    description = "The ability to export interfaces to downstream packages in the ament buildsystem in CMake.";
  };
})
