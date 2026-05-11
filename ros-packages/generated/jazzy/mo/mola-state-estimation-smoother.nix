{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gtsam,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  mola-bridge-ros2,
  mola-common,
  mola-gtsam-factors,
  mola-imu-preintegration,
  mola-kernel,
  mola-launcher,
  mrpt-libobs,
  nav-msgs,
  rclpy,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_state_estimation_smoother";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."mola_state_estimation_smoother";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint gtsam mola-common mola-gtsam-factors mola-imu-preintegration mola-kernel mola-launcher mrpt-libobs ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-chrono-dev" "libboost-date-time-dev" "libboost-filesystem-dev" "libboost-program-options-dev" "libboost-regex-dev" "libboost-serialization-dev" "libboost-system-dev" "libboost-thread-dev" "libboost-timer-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-xmllint gtsam mola-common mola-gtsam-factors mola-imu-preintegration mola-kernel mola-launcher mrpt-libobs ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-chrono-dev" "libboost-date-time-dev" "libboost-filesystem-dev" "libboost-program-options-dev" "libboost-regex-dev" "libboost-serialization-dev" "libboost-system-dev" "libboost-thread-dev" "libboost-timer-dev" ]; };
  checkInputs = [ ament-cmake-pytest geometry-msgs launch-testing launch-testing-ament-cmake launch-testing-ros mola-bridge-ros2 mola-launcher nav-msgs rclpy sensor-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "mola_state_estimation_smoother" = substituteSource {
      src = fetchgit {
        name = "mola_state_estimation_smoother-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "17d585464d65d6e2d70b49b8d94a1985497944b4";
        hash = "sha256-GR2gEXmwTt6ScSpGYRB5jxIZny/Wa0h6vDqWwrd36KE=";
      };
    };
  });
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
})
