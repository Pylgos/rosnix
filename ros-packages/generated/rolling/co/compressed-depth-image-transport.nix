{
  ament-cmake,
  ament-cmake-gtest,
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
  rcl-interfaces,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "compressed_depth_image_transport";
  version = "6.2.1-1";
  src = finalAttrs.passthru.sources."compressed_depth_image_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge image-transport pluginlib rcl-interfaces rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport pluginlib rcl-interfaces rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "compressed_depth_image_transport" = substituteSource {
      src = fetchgit {
        name = "compressed_depth_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "10123345e124ec3590c158a3a4abcee8823791c3";
        hash = "sha256-sSZZy5TwWq6gluyZULMAJW5XTeQmxNz5ckMItAX3cnQ=";
      };
    };
  });
  meta = {
    description = "\n    Compressed_depth_image_transport provides a plugin to image_transport for transparently sending\n    depth images (raw, floating-point) using PNG compression.\n  ";
  };
})
