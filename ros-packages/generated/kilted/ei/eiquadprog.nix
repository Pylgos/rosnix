{
  ament-cmake,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "eiquadprog";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."eiquadprog";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "doxygen" "eigen" "git" "graphviz" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "doxygen" "eigen" "git" "graphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "eiquadprog" = substituteSource {
      src = fetchgit {
        name = "eiquadprog-source";
        url = "https://github.com/ros2-gbp/eiquadprog-release.git";
        rev = "669d90a335ff973004cac0488873f789377fc322";
        hash = "sha256-66/c6KnJLaSXeaEj+/nDirY+F+q/rShl2qFHRjJU9PM=";
      };
    };
  });
  meta = {
    description = "\n    Eiquadprog a QP solver using active sets\n  ";
  };
})
