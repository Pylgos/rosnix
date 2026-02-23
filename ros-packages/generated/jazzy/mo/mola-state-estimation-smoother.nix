{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  mkSourceSet,
  mola-common,
  mola-gtsam-factors,
  mola-imu-preintegration,
  mola-kernel,
  mola-launcher,
  mrpt-libobs,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_state_estimation_smoother";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."mola_state_estimation_smoother";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint gtsam mola-common mola-gtsam-factors mola-imu-preintegration mola-kernel mola-launcher mrpt-libobs ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-chrono-dev" "libboost-date-time-dev" "libboost-filesystem-dev" "libboost-program-options-dev" "libboost-regex-dev" "libboost-serialization-dev" "libboost-system-dev" "libboost-thread-dev" "libboost-timer-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-xmllint gtsam mola-common mola-gtsam-factors mola-imu-preintegration mola-kernel mola-launcher mrpt-libobs ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-chrono-dev" "libboost-date-time-dev" "libboost-filesystem-dev" "libboost-program-options-dev" "libboost-regex-dev" "libboost-serialization-dev" "libboost-system-dev" "libboost-thread-dev" "libboost-timer-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mola_state_estimation_smoother" = substituteSource {
      src = fetchgit {
        name = "mola_state_estimation_smoother-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "3042d67993edc8c9bc199744f523b80c4553ef42";
        hash = "sha256-88ePla7AGrOSsf3KWQWvXILZdkxrk+TU5pcdHIKwpuw=";
      };
    };
  });
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
})
