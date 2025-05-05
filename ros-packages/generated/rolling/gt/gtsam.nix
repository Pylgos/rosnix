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
  pname = "gtsam";
  version = "4.2.0-6";
  src = finalAttrs.passthru.sources."gtsam";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "tbb" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "tbb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gtsam" = substituteSource {
      src = fetchgit {
        name = "gtsam-source";
        url = "https://github.com/ros2-gbp/gtsam-release.git";
        rev = "d3c5f105328d08db8595435da6ea09fc4096300a";
        hash = "sha256-ERY+Se9DNzpNImwnyrl2UGDHhSxLNmhlIL9anEb/CRg=";
      };
    };
  });
  meta = {
    description = "gtsam";
  };
})
