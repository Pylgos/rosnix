{
  ament-cmake,
  ament-cmake-black,
  ament-cmake-clang-format,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg-encoder-decoder,
  ffmpeg-image-transport-msgs,
  mkSourceSet,
  rclcpp,
  rcutils,
  ros-environment,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffmpeg_image_transport_tools";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."ffmpeg_image_transport_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ros-environment ];
  propagatedNativeBuildInputs = [ cv-bridge ffmpeg-encoder-decoder ffmpeg-image-transport-msgs rclcpp rcutils rosbag2-cpp rosbag2-storage sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-imgproc-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ cv-bridge ffmpeg-encoder-decoder ffmpeg-image-transport-msgs rclcpp rcutils rosbag2-cpp rosbag2-storage sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-imgproc-dev" ]; };
  checkInputs = [ ament-cmake-black ament-cmake-clang-format ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ffmpeg_image_transport_tools" = substituteSource {
      src = fetchgit {
        name = "ffmpeg_image_transport_tools-source";
        url = "https://github.com/ros2-gbp/ffmpeg_image_transport_tools-release.git";
        rev = "8bea8b8cf0ffba1c5daaf47cd508e281c48e831c";
        hash = "sha256-TOwE1+DayfIv/VSV5EeOGhmJv92wU6IScPxrbhT/f64=";
      };
    };
  });
  meta = {
    description = "tools for processing ffmpeg_image_transport_msgs";
  };
})
