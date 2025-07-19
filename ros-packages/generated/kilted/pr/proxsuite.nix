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
  version = "0.6.5-2";
  src = finalAttrs.passthru.sources."proxsuite";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "eigen" "git" "python3-numpy" "python3-scipy" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "doxygen" "eigen" "git" "python3-numpy" "python3-scipy" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "matio" ]; };
  passthru.sources = mkSourceSet (sources: {
    "proxsuite" = substituteSource {
      src = fetchgit {
        name = "proxsuite-source";
        url = "https://github.com/ros2-gbp/proxsuite-release.git";
        rev = "1ded99b9224c49091f654baf87cb46c1d3099ba5";
        hash = "sha256-Qfv+vWLLcZfUtZpRYZaoL3rQ3ibCYBKQcAkpFP0YdWI=";
      };
    };
  });
  meta = {
    description = "The Advanced Proximal Optimization Toolbox";
  };
})
