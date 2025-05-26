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
  version = "2.8.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_target_dependencies";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_target_dependencies" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_target_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "adc5f0bd4655ac0bb1384424ef5814d8c20be7bb";
        hash = "sha256-qFNTc0Txxdsy0E1u6Fsgk+hgrJvoZJ5FFr31031Pcvc=";
      };
    };
  });
  meta = {
    description = "The ability to add definitions, include directories and libraries of a package to a target in the ament buildsystem in CMake.";
  };
})
