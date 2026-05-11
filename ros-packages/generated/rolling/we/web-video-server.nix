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
  version = "3.1.1-1";
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
        rev = "a6aee2cb8ce7b2f87cc2251ce245133f5005b33c";
        hash = "sha256-xPuVLb6aaqnaZKrCSGBj7V58C8KNIBTVS/uX1gFmiSk=";
      };
    };
  });
  meta = {
    description = "HTTP Streaming of ROS Image Topics in Multiple Formats";
  };
})
