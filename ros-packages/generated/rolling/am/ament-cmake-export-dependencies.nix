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
  version = "2.7.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_export_dependencies";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_dependencies" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "898933b73f5f80c504b41075624a95d71a63faf8";
        hash = "sha256-CYnFRPva6p11GDiSzhW+twdKY5kRLss01Md3PBzLawM=";
      };
    };
  });
  meta = {
    description = "The ability to export dependencies to downstream packages in the ament buildsystem in CMake.";
  };
})
