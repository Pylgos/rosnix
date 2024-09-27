{
  ament_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_core-65ace2e56e472ed3b69364bd4fd7c652d752b15c = substituteSource {
      src = fetchgit {
        name = "ament_cmake_core-65ace2e56e472ed3b69364bd4fd7c652d752b15c-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "65ace2e56e472ed3b69364bd4fd7c652d752b15c";
        hash = "sha256-czHzCWezSznFjt0r10mEYbLNbFkZ1CoUf8QbjrZfsMM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_core";
  version = "2.5.2-1";
  src = sources.ament_cmake_core-65ace2e56e472ed3b69364bd4fd7c652d752b15c;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "python3-catkin-pkg-modules" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "python3-catkin-pkg-modules" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The core of the ament buildsystem in CMake. Several subcomponents provide specific funtionalities: * environment: provide prefix-level setup files * environment_hooks: provide package-level setup files and environment hooks * index: store information in an index and retrieve them without crawling * package_templates: templates from the ament_package Python package * symlink_install: use symlinks for CMake install commands";
  };
}
