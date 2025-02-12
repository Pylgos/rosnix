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
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "web_video_server";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."web_video_server";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ async-web-server-cpp cv-bridge image-transport rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "web_video_server" = substituteSource {
      src = fetchgit {
        name = "web_video_server-source";
        url = "https://github.com/ros2-gbp/web_video_server-release.git";
        rev = "f242093f0c5d914ee1da6998bed5778b345b261d";
        hash = "sha256-W0e1agACR4evkdS+ncZdaQm4B0a+/pyWfPgkFDUNfGY=";
      };
    };
  });
  meta = {
    description = "HTTP Streaming of ROS Image Topics in Multiple Formats";
  };
})
