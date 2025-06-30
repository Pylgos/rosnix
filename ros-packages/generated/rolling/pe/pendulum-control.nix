{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  pendulum-msgs,
  rclcpp,
  rmw-implementation-cmake,
  ros2run,
  rosSystemPackages,
  rttest,
  substituteSource,
  tlsf-cpp,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pendulum_control";
  version = "0.37.1-1";
  src = finalAttrs.passthru.sources."pendulum_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pendulum-msgs rclcpp rttest tlsf-cpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pendulum-msgs rclcpp rttest tlsf-cpp ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros rmw-implementation-cmake ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "pendulum_control" = substituteSource {
      src = fetchgit {
        name = "pendulum_control-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "fc4023b4d3355e779000aab66b0c5e56d8adff5d";
        hash = "sha256-Ufs0qmRGbkOvkUhls2g3yHlfS3m6WVlZrSDNt0zYYDU=";
      };
    };
  });
  meta = {
    description = "Demonstrates ROS 2's realtime capabilities with a simulated inverted pendulum.";
  };
})
