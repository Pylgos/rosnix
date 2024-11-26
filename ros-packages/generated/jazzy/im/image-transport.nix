{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message-filters,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_transport";
  version = "5.1.4-1";
  src = finalAttrs.passthru.sources."image_transport";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ message-filters pluginlib rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "image_transport" = substituteSource {
        src = fetchgit {
          name = "image_transport-source";
          url = "https://github.com/ros2-gbp/image_common-release.git";
          rev = "d1ebdfe1ed0dc2c90d16fa624fc21fe23bce6122";
          hash = "sha256-01/wzTSHt4s99cW7SmDH6W+kpY4ehCc4WbIcsq8Uws8=";
        };
      };
    });
  };
  meta = {
    description = "image_transport should always be used to subscribe to and publish images. It provides transparent support for transporting images in low-bandwidth compressed formats. Examples (provided by separate plugin packages) include JPEG/PNG compression and Theora streaming video.";
  };
})
