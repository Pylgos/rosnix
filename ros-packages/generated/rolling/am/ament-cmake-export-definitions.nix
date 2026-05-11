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
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_definitions";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_definitions" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_definitions-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "b9822c5f92059e91498cbf07cb8ec59375db3450";
        hash = "sha256-0zIRIgvtSZwbNE7EmoeN0Dz02sXML1UlTdk6qwSqz/Q=";
      };
    };
  });
  meta = {
    description = "The ability to export definitions to downstream packages in the ament buildsystem.";
  };
})
