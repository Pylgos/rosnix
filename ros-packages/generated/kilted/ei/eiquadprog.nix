{
  ament-cmake,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  jrl-cmakemodules,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "eiquadprog";
  version = "1.3.1-1";
  src = finalAttrs.passthru.sources."eiquadprog";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake jrl-cmakemodules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "doxygen" "eigen" "git" "graphviz" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake jrl-cmakemodules ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "doxygen" "eigen" "git" "graphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "eiquadprog" = substituteSource {
      src = fetchgit {
        name = "eiquadprog-source";
        url = "https://github.com/ros2-gbp/eiquadprog-release.git";
        rev = "422bf49189d1c19fb6b32b6d4fbe385c7df2a276";
        hash = "sha256-UcrDtNigQlfjFt6p2IM3zRCNgN/i9lc16Lpe+9KbFNs=";
      };
    };
  });
  meta = {
    description = "\n    Eiquadprog a QP solver using active sets\n  ";
  };
})
