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
  version = "2.5.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_core";
  propagatedNativeBuildInputs = [ ament-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "python3-catkin-pkg-modules" ]; };
  propagatedBuildInputs = [ ament-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "python3-catkin-pkg-modules" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_core" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_core-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "65ace2e56e472ed3b69364bd4fd7c652d752b15c";
        hash = "sha256-czHzCWezSznFjt0r10mEYbLNbFkZ1CoUf8QbjrZfsMM=";
      };
    };
  });
  meta = {
    description = "The core of the ament buildsystem in CMake. Several subcomponents provide specific funtionalities: * environment: provide prefix-level setup files * environment_hooks: provide package-level setup files and environment hooks * index: store information in an index and retrieve them without crawling * package_templates: templates from the ament_package Python package * symlink_install: use symlinks for CMake install commands";
  };
})
