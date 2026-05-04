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
  version = "2.8.7-2";
  src = finalAttrs.passthru.sources."ament_cmake_core";
  propagatedNativeBuildInputs = [ ament-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "python3-catkin-pkg-modules" ]; };
  propagatedBuildInputs = [ ament-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "python3-catkin-pkg-modules" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_core" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_core-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "e74a5e0b487a6fe6954b71dc2db9fdd006fe6f98";
        hash = "sha256-NzFwU/aTxs5TEpR4spO9wUBJUQxx8muDHrNJGmDwYYo=";
      };
    };
  });
  meta = {
    description = "\n    The core of the ament buildsystem in CMake.\n\n    Several subcomponents provide specific funtionalities:\n    * environment: provide prefix-level setup files\n    * environment_hooks: provide package-level setup files and environment hooks\n    * index: store information in an index and retrieve them without crawling\n    * package_templates: templates from the ament_package Python package\n    * symlink_install: use symlinks for CMake install commands\n  ";
  };
})
