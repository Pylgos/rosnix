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
  version = "2.7.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_target_dependencies";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-include-directories ament-cmake-libraries ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_target_dependencies" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_target_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "99e47bf1deddaa6a826dc5ac8522157fad845906";
        hash = "sha256-M957LBvWjYxQNvVk7+Jk+doWTssjd/YKu0UV47gEYdc=";
      };
    };
  });
  meta = {
    description = "The ability to add definitions, include directories and libraries of a package to a target in the ament buildsystem in CMake.";
  };
})
