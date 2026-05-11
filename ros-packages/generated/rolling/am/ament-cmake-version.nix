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
  pname = "ament_cmake_version";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_version";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_version" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_version-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "1911f57133feebbd2d7b3aa78530c8e843100add";
        hash = "sha256-rYrBMhgqmDupxIWR8ubYUEZ7NfDQcsWy5p3pH0XY9MY=";
      };
    };
  });
  meta = {
    description = "The ability to override the exported package version in the ament buildsystem.";
  };
})
