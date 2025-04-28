{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_export_definitions";
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_definitions";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_definitions" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_definitions-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "cb689b914c25bbecd54eb1638d4d05907cfb1045";
        hash = "sha256-GJUuXdCTm78igVCuXeUUri9L5wiO8+ofYwXjNQwG9FU=";
      };
    };
  });
  meta = {
    description = "The ability to export definitions to downstream packages in the ament buildsystem.";
  };
})
