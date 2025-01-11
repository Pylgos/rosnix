{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  mkSourceSet,
  mola-common,
  mola-imu-preintegration,
  mola-kernel,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_state_estimation_smoother";
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."mola_state_estimation_smoother";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gtsam mola-common mola-imu-preintegration mola-kernel mrpt-libobs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-chrono-dev" "libboost-date-time-dev" "libboost-filesystem-dev" "libboost-program-options-dev" "libboost-regex-dev" "libboost-serialization-dev" "libboost-system-dev" "libboost-thread-dev" "libboost-timer-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mola_state_estimation_smoother" = substituteSource {
      src = fetchgit {
        name = "mola_state_estimation_smoother-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "d16c4563c79e8415a33c061616af0f27a296561e";
        hash = "sha256-Wnwbd6A1pNL/jWYTbefyCJHaLPgexiLXmt3z6E8DgAQ=";
      };
    };
  });
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
})
