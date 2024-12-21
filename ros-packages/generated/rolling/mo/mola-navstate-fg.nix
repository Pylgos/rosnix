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
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."mola_navstate_fg";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gtsam mola-common mola-imu-preintegration mola-kernel mrpt-libobs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-chrono-dev" "libboost-date-time-dev" "libboost-filesystem-dev" "libboost-program-options-dev" "libboost-regex-dev" "libboost-serialization-dev" "libboost-system-dev" "libboost-thread-dev" "libboost-timer-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mola_navstate_fg" = substituteSource {
      src = fetchgit {
        name = "mola_navstate_fg-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "8cd4b1b4db7215e7eda906391a2ad77bb0878e67";
        hash = "sha256-rljj6vw8QjPAUxJ3HMVHOp67y1A+lcH4qF3NAC8JXZE=";
      };
    };
  });
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
})
