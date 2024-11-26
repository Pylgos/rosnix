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
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."event_camera_renderer";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ event-camera-codecs event-camera-msgs image-transport rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "event_camera_renderer" = substituteSource {
        src = fetchgit {
          name = "event_camera_renderer-source";
          url = "https://github.com/ros2-gbp/event_camera_renderer-release.git";
          rev = "224dfb7f7b9201a58a0bdba4eb8bb69deb44f3b0";
          hash = "sha256-WnRWflQ+N8Urzm077M3kQCQ5qXRvnyKtXlxE2ITfAiY=";
        };
      };
    });
  };
  meta = {
    description = "package for rendering event_camera_msgs";
  };
})
