{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-pycodestyle,
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
    "ament_cmake_pycodestyle" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pycodestyle-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "f40575f5f47905d401902fe267dd018eb3529c4b";
        hash = "sha256-NZlTgSZUwDO2wYr58UHvavY/enyZAFV6GsQjKSmgqg8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament-cmake-pycodestyle";
  version = "0.17.1-1";
  src = sources."ament_cmake_pycodestyle";
  nativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-test ament-pycodestyle ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The CMake API for ament_pycodestyle to check code against the style conventions in PEP 8.";
  };
}
