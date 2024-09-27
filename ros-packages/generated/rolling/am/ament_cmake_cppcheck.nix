{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cppcheck,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_cppcheck-ef6b2ee5acddf52e86397906771a1e34ab239548 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_cppcheck-ef6b2ee5acddf52e86397906771a1e34ab239548-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "ef6b2ee5acddf52e86397906771a1e34ab239548";
        hash = "sha256-T3HGXsDFGtaVI4UkYIPoScM4pG7mnJPwQCynIzsN02o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_cppcheck";
  version = "0.18.1-1";
  src = sources.ament_cmake_cppcheck-ef6b2ee5acddf52e86397906771a1e34ab239548;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cppcheck ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_test ament_cppcheck ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The CMake API for ament_cppcheck to perform static code analysis on C/C++ code using Cppcheck.";
  };
}
