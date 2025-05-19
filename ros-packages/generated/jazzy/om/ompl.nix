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
  pname = "ompl";
  version = "1.7.0-2";
  src = finalAttrs.passthru.sources."ompl";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "cmake" "eigen" "libflann-dev" "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "cmake" "eigen" "libflann-dev" "pkg-config" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ompl" = substituteSource {
      src = fetchgit {
        name = "ompl-source";
        url = "https://github.com/ros2-gbp/ompl-release.git";
        rev = "93a7d7a7d2d7f0c93962629d5994d3f5e1e750b9";
        hash = "sha256-Dgz+MG+eZ+gJri8KGw4hcBo7pXz5PpnP5CcIfcHwhRQ=";
      };
    };
  });
  meta = {
    description = "OMPL is a free sampling-based motion planning library.";
  };
})
