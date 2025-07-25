{
  ament-copyright,
  ament-flake8,
  ament-mypy,
  ament-pep257,
  buildAmentPythonPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  ros2bag,
  rosSystemPackages,
  rosbag2-py,
  rosidl-runtime-py,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rosbag2_to_video";
  version = "1.0.1-2";
  src = finalAttrs.passthru.sources."rosbag2_to_video";
  propagatedNativeBuildInputs = [ cv-bridge rclpy ros2bag rosbag2-py rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" "python3-opencv" ]; };
  propagatedBuildInputs = [ cv-bridge rclpy ros2bag rosbag2-py rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" "python3-opencv" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_to_video" = substituteSource {
      src = fetchgit {
        name = "rosbag2_to_video-source";
        url = "https://github.com/ros2-gbp/rosbag2_to_video-release.git";
        rev = "55ad85864d58c832ec94480e0188e6040f0f2967";
        hash = "sha256-cIIIILgxEls8aRJ8CNJa9vP6dRz4Xw0ARTQudqviVWI=";
      };
    };
  });
  meta = {
    description = "Command line tool to create a video from a rosbag recording";
  };
})
