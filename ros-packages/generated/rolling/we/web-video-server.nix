{
  ament-cmake-copyright,
  ament-cmake-cpplint,
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
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "web_video_server";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."web_video_server";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ async-web-server-cpp cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "ffmpeg" ]; };
  buildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ async-web-server-cpp cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "ffmpeg" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "web_video_server" = substituteSource {
      src = fetchgit {
        name = "web_video_server-source";
        url = "https://github.com/ros2-gbp/web_video_server-release.git";
        rev = "a5287684f508e20f0e4d358696c6117a2b0f0c00";
        hash = "sha256-z6gIcOvRPHlQZQ5Fc+mIJ8fzvH3NKPxS8fZD5Ks4SKA=";
      };
    };
  });
  meta = {
    description = "HTTP Streaming of ROS Image Topics in Multiple Formats";
  };
})
