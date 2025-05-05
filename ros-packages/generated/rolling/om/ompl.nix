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
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."ompl";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "eigen" "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libflann-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ompl" = substituteSource {
      src = fetchgit {
        name = "ompl-source";
        url = "https://github.com/ros2-gbp/ompl-release.git";
        rev = "16faf3428966bc6e04209c67733b6fdeeee3a458";
        hash = "sha256-JFOuqj4J5gxpYIBguMm8myXA8kPLN9GIgbdhc4kSLFo=";
      };
    };
  });
  meta = {
    description = "OMPL is a free sampling-based motion planning library.";
  };
})
