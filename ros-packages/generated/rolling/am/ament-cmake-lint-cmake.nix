{
  ament-cmake-core,
  ament-cmake-test,
  ament-lint-cmake,
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
    "ament_cmake_lint_cmake" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_lint_cmake-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "fb34b082d5c244046734d507d4a5be7197930e65";
        hash = "sha256-LKc/ifj8iO1/NbQEfnPbDsLrt27m7HBxcjAzjj24YvQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_lint_cmake";
  version = "0.18.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_lint_cmake";
  nativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-test ament-lint-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-test ament-lint-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "The CMake API for ament_lint_cmake to lint CMake code using cmakelint.";
  };
})
