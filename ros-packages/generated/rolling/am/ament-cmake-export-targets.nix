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
  pname = "ament_cmake_export_targets";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_targets";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_targets" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_targets-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "b22ecc2f78b36536392be73cf6d5acbe63ee38cb";
        hash = "sha256-cQlHQ8cFv6X/Bij/gpZAH+2kh3cBKkZtIOIOr/bX3m8=";
      };
    };
  });
  meta = {
    description = "The ability to export targets to downstream packages in the ament buildsystem in CMake.";
  };
})
