{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  event-camera-codecs,
  event-camera-msgs,
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
  pname = "event_camera_renderer";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."event_camera_renderer";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ];
  propagatedNativeBuildInputs = [ event-camera-codecs event-camera-msgs image-transport rclcpp rclcpp-components ros-environment sensor-msgs ];
  buildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ];
  propagatedBuildInputs = [ event-camera-codecs event-camera-msgs image-transport rclcpp rclcpp-components ros-environment sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "event_camera_renderer" = substituteSource {
      src = fetchgit {
        name = "event_camera_renderer-source";
        url = "https://github.com/ros2-gbp/event_camera_renderer-release.git";
        rev = "3f1c7de565e4ddcc6e6bda25f827917ac6ec201e";
        hash = "sha256-96JO7kJUYHB/XIYkvdXTftiE5dH+BNBua8RVjN11Y1w=";
      };
    };
  });
  meta = {
    description = "package for rendering event_camera_msgs";
  };
})
