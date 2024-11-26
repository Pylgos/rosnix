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
  pname = "libnabo";
  version = "1.1.1-2";
  src = finalAttrs.passthru.sources."libnabo";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "libnabo" = substituteSource {
        src = fetchgit {
          name = "libnabo-source";
          url = "https://github.com/ros2-gbp/libnabo-release.git";
          rev = "160592c7ea514f53d953d86d718910a908cbfd21";
          hash = "sha256-v97tjlJi2QXQYpa3qut6ICB4FlDDEz6GBYMY9ParEWw=";
        };
      };
    });
  };
  meta = {
    description = "libnabo is a fast K Nearest Neighbour library for low-dimensional spaces.";
  };
})
