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
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_transport";
  version = "6.4.4-1";
  src = finalAttrs.passthru.sources."image_transport";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ message-filters pluginlib rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ message-filters pluginlib rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp-lifecycle ];
  passthru.sources = mkSourceSet (sources: {
    "image_transport" = substituteSource {
      src = fetchgit {
        name = "image_transport-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "c14ae928c1e607fd63d52d04703f3d44cfeee888";
        hash = "sha256-ZQqXN6yAKxBU75ngGfgABvuGFb2mKP27kTDLGBE8IO8=";
      };
    };
  });
  meta = {
    description = "\n\n     image_transport should always be used to subscribe to and publish images. It provides transparent\n     support for transporting images in low-bandwidth compressed formats. Examples (provided by separate\n     plugin packages) include JPEG/PNG compression and Theora streaming video.\n\n  ";
  };
})
