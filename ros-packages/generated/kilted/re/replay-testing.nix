{
  ament-cmake,
  ament-cmake-pytest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  mkSourceSet,
  rclpy,
  ros2bag,
  ros2run,
  ros2topic,
  rosSystemPackages,
  rosbag2-py,
  rosbag2-storage-mcap,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "replay_testing";
  version = "0.0.4-1";
  src = finalAttrs.passthru.sources."replay_testing";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch rclpy ros2bag rosbag2-py rosbag2-storage-mcap ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-boto3" "python3-pydantic" "python3-requests" "python3-termcolor" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch rclpy ros2bag rosbag2-py rosbag2-storage-mcap ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-boto3" "python3-pydantic" "python3-requests" "python3-termcolor" ]; };
  checkInputs = [ ament-cmake-pytest geometry-msgs ros2run ros2topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-junitparser" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "replay_testing" = substituteSource {
      src = fetchgit {
        name = "replay_testing-source";
        url = "https://github.com/ros2-gbp/replay_testing-release.git";
        rev = "7bac3e238e5473fcd895c51d14bc003219f2b109";
        hash = "sha256-NPfdfiFaXRj+17KZy73VWWkHHa+kidEX4TRH5hZ/W80=";
      };
    };
  });
  meta = {
    description = "A testing library and CLI for replaying ROS nodes.";
  };
})
