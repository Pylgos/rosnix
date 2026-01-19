{
  ament-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_core";
  version = "2.7.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_core";
  propagatedNativeBuildInputs = [ ament-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "python3-catkin-pkg-modules" ]; };
  propagatedBuildInputs = [ ament-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "python3-catkin-pkg-modules" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_core" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_core-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "dfb9a2ffc0f1bf40b3a60c35526d7b283be50dcd";
        hash = "sha256-4X77uQe8FHLBwc/51GPqeFM4qJodd9kfcHImeoCwV9Y=";
      };
    };
  });
  meta = {
    description = "\n    The core of the ament buildsystem in CMake.\n\n    Several subcomponents provide specific funtionalities:\n    * environment: provide prefix-level setup files\n    * environment_hooks: provide package-level setup files and environment hooks\n    * index: store information in an index and retrieve them without crawling\n    * package_templates: templates from the ament_package Python package\n    * symlink_install: use symlinks for CMake install commands\n  ";
  };
})
