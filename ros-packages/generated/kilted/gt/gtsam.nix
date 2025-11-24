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
  version = "4.3.0-3";
  src = finalAttrs.passthru.sources."gtsam";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "tbb" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "tbb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gtsam" = substituteSource {
      src = fetchgit {
        name = "gtsam-source";
        url = "https://github.com/ros2-gbp/gtsam-release.git";
        rev = "30bf4be46f807cdfd6535e9a313bfc30029695ed";
        hash = "sha256-sTBy+OnSLs8X9LLVfCxJKJ0OfmVOXWgiFkFAtL6Q9C4=";
      };
    };
  });
  meta = {
    description = "gtsam";
  };
})
