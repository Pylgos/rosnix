{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cppcheck,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ament_cmake_cppcheck" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "ef6b2ee5acddf52e86397906771a1e34ab239548";
        hash = "sha256-T3HGXsDFGtaVI4UkYIPoScM4pG7mnJPwQCynIzsN02o=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_cppcheck";
  version = "0.18.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_cppcheck";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cppcheck ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ament-cppcheck ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "The CMake API for ament_cppcheck to perform static code analysis on C/C++ code using Cppcheck.";
  };
})
