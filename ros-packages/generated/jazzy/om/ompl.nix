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
  version = "1.6.0-1";
  src = finalAttrs.passthru.sources."ompl";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libflann-dev" "opende" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ompl" = substituteSource {
        src = fetchgit {
          name = "ompl-source";
          url = "https://github.com/ros2-gbp/ompl-release.git";
          rev = "fda1cb4c5d644b8ea2932b45d35293cd62ff5dcd";
          hash = "sha256-Dst2FtQsK0+EzvSm7GEESWOU8QfMPzhSNNYEIlTNfc0=";
        };
      };
    });
  };
  meta = {
    description = "OMPL is a free sampling-based motion planning library.";
  };
})
