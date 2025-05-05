{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-imu-preintegration,
  mola-kernel,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_state_estimation_simple";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."mola_state_estimation_simple";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mola-imu-preintegration mola-kernel mrpt-libobs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-imu-preintegration mola-kernel mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_state_estimation_simple" = substituteSource {
      src = fetchgit {
        name = "mola_state_estimation_simple-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "a4f9cabc6c8403466de0de7e810581f856634ffd";
        hash = "sha256-yboKNAM8z1XbdtdbTYy5ItIDbbLBjWigcYrzUcCA3qE=";
      };
    };
  });
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
})
