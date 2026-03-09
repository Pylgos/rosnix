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
  version = "2.5.6-2";
  src = finalAttrs.passthru.sources."ament_cmake_core";
  propagatedNativeBuildInputs = [ ament-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "python3-catkin-pkg-modules" ]; };
  propagatedBuildInputs = [ ament-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "python3-catkin-pkg-modules" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_core" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_core-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "3aa4626c9031429c10a9bd7df376ce5b6f30638c";
        hash = "sha256-ViU6oYQEAR+lGZ1Q8wV/lOySp+L0iSZ7bxH2PYvu/YY=";
      };
    };
  });
  meta = {
    description = "\n    The core of the ament buildsystem in CMake.\n\n    Several subcomponents provide specific funtionalities:\n    * environment: provide prefix-level setup files\n    * environment_hooks: provide package-level setup files and environment hooks\n    * index: store information in an index and retrieve them without crawling\n    * package_templates: templates from the ament_package Python package\n    * symlink_install: use symlinks for CMake install commands\n  ";
  };
})
