{
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-copyright,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ament_cmake_copyright" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "3eee9f480599ef84f04598846f8a30bbf085ab8c";
        hash = "sha256-zZUUCpwdbCBzUP/WpoLngFdUgSf9Heu4m6ICWhy+HJI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_cmake_copyright";
  version = "0.18.1-1";
  src = sources."ament_cmake_copyright";
  nativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-test ament-copyright ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-test ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-lint-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The CMake API for ament_copyright to check every source file contains copyright reference.";
  };
}
