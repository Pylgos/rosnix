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
  pname = "mola_navstate_fg";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."mola_navstate_fg";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gtsam mola-common mola-imu-preintegration mola-kernel mrpt-libobs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-chrono-dev" "libboost-date-time-dev" "libboost-filesystem-dev" "libboost-program-options-dev" "libboost-regex-dev" "libboost-serialization-dev" "libboost-system-dev" "libboost-thread-dev" "libboost-timer-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mola_navstate_fg" = substituteSource {
      src = fetchgit {
        name = "mola_navstate_fg-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "3abb5981f219d4bb0f6e995bcb7925ecdf69eef0";
        hash = "sha256-AOWCtGE1jUXQ6mLXVmQqc+5yZNgk3BoMAsPsuMtuuiE=";
      };
    };
  });
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
})
