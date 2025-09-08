{
  ament-cmake,
  ament-cmake-clang-format,
  ament-lint-auto,
  ament-lint-common,
  apriltag-msgs,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "apriltag_draw";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."apriltag_draw";
  nativeBuildInputs = [ ament-cmake ros-environment ];
  propagatedNativeBuildInputs = [ apriltag-msgs cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake ros-environment ];
  propagatedBuildInputs = [ apriltag-msgs cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "apriltag_draw" = substituteSource {
      src = fetchgit {
        name = "apriltag_draw-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "c09ec14f64cb3be5f16430051f5adb42e2107842";
        hash = "sha256-TQJliwZvIAn9JZvWdMzVdQt8p/171ppx32w0alvj66A=";
      };
    };
  });
  meta = {
    description = "ROS package for drawing apriltags on image";
  };
})
