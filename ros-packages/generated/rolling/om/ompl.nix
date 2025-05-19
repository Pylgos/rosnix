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
        rev = "e268e2ac1914adf548e4284acf33140737a30a6c";
        hash = "sha256-Dgz+MG+eZ+gJri8KGw4hcBo7pXz5PpnP5CcIfcHwhRQ=";
      };
    };
  });
  meta = {
    description = "OMPL is a free sampling-based motion planning library.";
  };
})
