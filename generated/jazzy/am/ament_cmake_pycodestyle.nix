{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_pycodestyle,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pycodestyle-f40575f5f47905d401902fe267dd018eb3529c4b = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pycodestyle-f40575f5f47905d401902fe267dd018eb3529c4b-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "f40575f5f47905d401902fe267dd018eb3529c4b";
        hash = "sha256-NZlTgSZUwDO2wYr58UHvavY/enyZAFV6GsQjKSmgqg8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pycodestyle";
  version = "0.17.1-1";
  src = sources.ament_cmake_pycodestyle-f40575f5f47905d401902fe267dd018eb3529c4b;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pycodestyle ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The CMake API for ament_pycodestyle to check code against the style conventions in PEP 8.";
  };
}
