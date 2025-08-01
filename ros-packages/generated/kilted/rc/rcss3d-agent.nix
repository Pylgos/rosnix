{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rcss3d-agent-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcss3d_agent";
  version = "0.4.1-4";
  src = finalAttrs.passthru.sources."rcss3d_agent";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp rcss3d-agent-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp rcss3d-agent-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcss3d_agent" = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "261f2aa36a4b467e573bff22e58114013b1967e0";
        hash = "sha256-U3T+91EoVbYapHoNLcIBJqlUz/YI9BB5jc7jAEpVpZw=";
      };
    };
  });
  meta = {
    description = "Launches a RoboCup 3D Simulation Agent, and converts data to and from ROS2 msgs";
  };
})
