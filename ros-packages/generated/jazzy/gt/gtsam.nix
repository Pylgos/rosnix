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
  version = "4.2.0-4";
  src = finalAttrs.passthru.sources."gtsam";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "tbb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gtsam" = substituteSource {
      src = fetchgit {
        name = "gtsam-source";
        url = "https://github.com/ros2-gbp/gtsam-release.git";
        rev = "417ef871550e7e13a51a717e2f4b16ebf17e3f81";
        hash = "sha256-ERY+Se9DNzpNImwnyrl2UGDHhSxLNmhlIL9anEb/CRg=";
      };
    };
  });
  meta = {
    description = "gtsam";
  };
})
