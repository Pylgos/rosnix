{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rcutils,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "theora_image_transport";
  version = "5.0.1-1";
  src = finalAttrs.passthru.sources."theora_image_transport";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ cv-bridge image-transport pluginlib rclcpp rcutils rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libogg" "libopencv-imgproc-dev" "libtheora" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "theora_image_transport" = substituteSource {
        src = fetchgit {
          name = "theora_image_transport-source";
          url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
          rev = "a0f6ff899819005ae54ac8157bb6e61c5503ff3d";
          hash = "sha256-w3KYn9AptXAW/RoC9FboG+xntJTgNbgS+bZe1sSPJxY=";
        };
      };
    });
  };
  meta = {
    description = "Theora_image_transport provides a plugin to image_transport for transparently sending an image stream encoded with the Theora codec.";
  };
})
