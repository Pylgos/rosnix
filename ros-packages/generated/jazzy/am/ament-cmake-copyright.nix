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
        rev = "1b5882814156bc618855e3ea600b8956676362c9";
        hash = "sha256-t0vY5c9Qog/0tjpoeXMzi90mG3EGT93frRtS4CWiCok=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_cmake_copyright";
  version = "0.17.1-1";
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
