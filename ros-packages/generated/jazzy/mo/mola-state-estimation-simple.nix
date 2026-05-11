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
  version = "2.3.1-1";
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
        rev = "494c1240d3913c40e861156ce76f059ba420a72d";
        hash = "sha256-yJR79WCgzf0QpfY/kl00PaNfhLZH7sJFmEevCshj+0E=";
      };
    };
  });
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
})
