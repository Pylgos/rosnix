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
  version = "2.5.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_export_dependencies";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_dependencies" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "d3b99d078393bd1acbb2459cc4b1ec7534d68324";
        hash = "sha256-S1tYBjIjvtfJCrfis6oUq5wEgO6kpa3y9j3GMIeLk/k=";
      };
    };
  });
  meta = {
    description = "The ability to export dependencies to downstream packages in the ament buildsystem in CMake.";
  };
})
