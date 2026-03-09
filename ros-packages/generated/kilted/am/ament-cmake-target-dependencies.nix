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
  version = "2.7.5-1";
  src = finalAttrs.passthru.sources."ament_cmake_target_dependencies";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_target_dependencies" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_target_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "42573f749fc3d998cb58f6bb016ee35a04efd708";
        hash = "sha256-Xx/VWK0XtUpMt0qicGWrYPckk6/vkWGiwhDKsBMgmQ8=";
      };
    };
  });
  meta = {
    description = "The ability to add definitions, include directories and libraries of a package to a target in the ament buildsystem in CMake.";
  };
})
