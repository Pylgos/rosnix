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
  version = "2.8.5-1";
  src = finalAttrs.passthru.sources."ament_cmake_target_dependencies";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_target_dependencies" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_target_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "3939a1b4337c2ae019b36518216c6a8e85e10fdc";
        hash = "sha256-cD5vEUXlcBnOj4lUQZYWzNB3d3xZej72oModM7HyiB0=";
      };
    };
  });
  meta = {
    description = "The ability to add definitions, include directories and libraries of a package to a target in the ament buildsystem in CMake.";
  };
})
