{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  mkSourceSet,
  mola-common,
  mrpt-libposes,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_gtsam_factors";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."mola_gtsam_factors";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gtsam mola-common mrpt-libposes ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gtsam mola-common mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "mola_gtsam_factors" = substituteSource {
      src = fetchgit {
        name = "mola_gtsam_factors-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "8b8901ce6980311b12825b94dc8fa87fc8e50d0a";
        hash = "sha256-V2mFy2GDMpAGp1I124NpSD8txRuOJbQzHfJSrgBPzhY=";
      };
    };
  });
  meta = {
    description = "C++ library with reusable GTSAM Factors useful in georeferencing and state-estimation MOLA modules";
  };
})
