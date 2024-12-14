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
  version = "2.7.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_export_definitions";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_definitions" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_definitions-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "0591a758474c9ea8f79f94473a3773baea2883eb";
        hash = "sha256-rkxyd3nb0mHczHSWGAmTKAp4aOuWIEMt7nv5Lk0G+oo=";
      };
    };
  });
  meta = {
    description = "The ability to export definitions to downstream packages in the ament buildsystem.";
  };
})
