{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "proxsuite";
  version = "0.6.5-1";
  src = finalAttrs.passthru.sources."proxsuite";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "git" "python3-numpy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-scipy" "simde" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "matio" ]; };
  passthru.sources = mkSourceSet (sources: {
    "proxsuite" = substituteSource {
      src = fetchgit {
        name = "proxsuite-source";
        url = "https://github.com/ros2-gbp/proxsuite-release.git";
        rev = "b1b7dbc9106d896b347c4d5db9d01de37e0c2a2c";
        hash = "sha256-Qfv+vWLLcZfUtZpRYZaoL3rQ3ibCYBKQcAkpFP0YdWI=";
      };
    };
  });
  meta = {
    description = "The Advanced Proximal Optimization Toolbox";
  };
})
