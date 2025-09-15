{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  live555-vendor,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtsp_image_transport";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."rtsp_image_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge image-transport live555-vendor pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ffmpeg" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport live555-vendor pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rtsp_image_transport" = substituteSource {
      src = fetchgit {
        name = "rtsp_image_transport-source";
        url = "https://github.com/ros2-gbp/rtsp_image_transport-release.git";
        rev = "a0eae3b0b816ad84d37be1558f3e6eb5890c49f5";
        hash = "sha256-ohhP4JI2wM0apbyAnc7TwYp3uQnM0uEwifbiMIHe4YE=";
      };
    };
  });
  meta = {
    description = "Transmit video streams with the Real-Time Streaming Protocol";
  };
})
