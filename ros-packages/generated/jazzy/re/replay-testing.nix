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
  version = "0.0.3-1";
  src = finalAttrs.passthru.sources."replay_testing";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch rclpy ros2bag rosbag2-py rosbag2-storage-mcap ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-boto3" "python3-pydantic" "python3-termcolor" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch rclpy ros2bag rosbag2-py rosbag2-storage-mcap ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-boto3" "python3-pydantic" "python3-termcolor" ]; };
  checkInputs = [ ament-cmake-pytest geometry-msgs ros2run ros2topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-junitparser" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "replay_testing" = substituteSource {
      src = fetchgit {
        name = "replay_testing-source";
        url = "https://github.com/ros2-gbp/replay_testing-release.git";
        rev = "61410bccadde507c5a4de3407a299bfe5c77c5ff";
        hash = "sha256-lCnmer+Ffx20P+CWXebDTJcG9azlPVs1+DH140ffsMA=";
      };
    };
  });
  meta = {
    description = "A testing library and CLI for replaying ROS nodes.";
  };
})
