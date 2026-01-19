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
  version = "4.3.0-2";
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
        rev = "147c402c2683e58f240da54db625e646f2425b3c";
        hash = "sha256-37m+gdPnCmromxDhqHHNV95a4Hc3jVrFHnVgfprqR/w=";
      };
    };
  });
  meta = {
    description = "gtsam";
  };
})
