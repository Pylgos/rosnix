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
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."pendulum_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pendulum-msgs rclcpp rttest tlsf-cpp ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros rmw-implementation-cmake ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "pendulum_control" = substituteSource {
      src = fetchgit {
        name = "pendulum_control-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "8d2c0bdd02d8626fc6073151b8edbe77eaf50db0";
        hash = "sha256-568kzphU7SOSejnCyfq2Qm8FiWxwULO/7QCym8k2V5k=";
      };
    };
  });
  meta = {
    description = "Demonstrates ROS 2's realtime capabilities with a simulated inverted pendulum.";
  };
})
