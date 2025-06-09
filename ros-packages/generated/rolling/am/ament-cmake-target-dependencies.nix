{
  ament-cmake-core,
  ament-cmake-include-directories,
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
  pname = "ament_cmake_target_dependencies";
  version = "2.8.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_target_dependencies";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_target_dependencies" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_target_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "9ed80b4548aa1aebf8b07ca8341e4bb9a71c1893";
        hash = "sha256-zmrhXVajtuamD4wtk2S8VC1GGycV62TFYmfxSsgEpHo=";
      };
    };
  });
  meta = {
    description = "The ability to add definitions, include directories and libraries of a package to a target in the ament buildsystem in CMake.";
  };
})
