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
  pname = "ament_cmake_export_link_flags";
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_link_flags";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_link_flags" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_link_flags-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "6a89329c2dd4da2e7ad581992dc1220224f836b4";
        hash = "sha256-KdDMDyin5Z1z3ZtlWyMyytw4tGTpZ4MqACNvBzSNcZw=";
      };
    };
  });
  meta = {
    description = "The ability to export link flags to downstream packages in the ament buildsystem.";
  };
})
