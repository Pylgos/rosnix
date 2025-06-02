{
  ament-cmake,
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
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffmpeg_encoder_decoder";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."ffmpeg_encoder_decoder";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ cv-bridge rclcpp sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ffmpeg" "libavdevice-dev" "libopencv-imgproc-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ cv-bridge rclcpp sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" "libavdevice-dev" "libopencv-imgproc-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ffmpeg_encoder_decoder" = substituteSource {
      src = fetchgit {
        name = "ffmpeg_encoder_decoder-source";
        url = "https://github.com/ros2-gbp/ffmpeg_encoder_decoder-release.git";
        rev = "bece0dee4380af5c32f1d9390394c06dde78d0f8";
        hash = "sha256-cAfBKi4D2UYa7aLn62WwdfwRqv+Owgc2a7JXlYomtOs=";
      };
    };
  });
  meta = {
    description = "ROS2 convenience wrapper around ffmpeg for encoding/decoding";
  };
})
