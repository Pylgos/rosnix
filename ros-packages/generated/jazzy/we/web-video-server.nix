{
  ament-cmake-clang-tidy,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-ros,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  async-web-server-cpp,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rmw,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "web_video_server";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."web_video_server";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ async-web-server-cpp cv-bridge image-transport pluginlib rclcpp rclcpp-components rmw sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "ffmpeg" "libopencv-dev" ]; };
  buildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ async-web-server-cpp cv-bridge image-transport pluginlib rclcpp rclcpp-components rmw sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "ffmpeg" "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-clang-tidy ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "web_video_server" = substituteSource {
      src = fetchgit {
        name = "web_video_server-source";
        url = "https://github.com/ros2-gbp/web_video_server-release.git";
        rev = "eee9f21b035551f3e2dc728dbe1595cfad26a0f5";
        hash = "sha256-SFoFotNgLfUIcQwp8NzKqFKq3/dmE1uAamdwQb42hZc=";
      };
    };
  });
  meta = {
    description = "HTTP Streaming of ROS Image Topics in Multiple Formats";
  };
})
