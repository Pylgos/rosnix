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
  version = "5.0.2-1";
  src = finalAttrs.passthru.sources."theora_image_transport";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ cv-bridge image-transport pluginlib rclcpp rcutils rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libogg" "libopencv-imgproc-dev" "libtheora" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ cv-bridge image-transport pluginlib rclcpp rcutils rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libogg" "libopencv-imgproc-dev" "libtheora" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "theora_image_transport" = substituteSource {
      src = fetchgit {
        name = "theora_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "22e4e8c3361ff87d86fd37ee146e2da7bcaf05fa";
        hash = "sha256-/rKPhnolIOscgvh78TCGAIVFIvwZzzv75nVeX7s/psA=";
      };
    };
  });
  meta = {
    description = "\n    Theora_image_transport provides a plugin to image_transport for\n    transparently sending an image stream encoded with the Theora codec.\n  ";
  };
})
