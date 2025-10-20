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
  version = "6.1.3-1";
  src = finalAttrs.passthru.sources."image_transport";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ message-filters pluginlib rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ message-filters pluginlib rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_transport" = substituteSource {
      src = fetchgit {
        name = "image_transport-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "aba3dbfcbc8aa59b005d1c2ed11d25f186d07c0c";
        hash = "sha256-r3hZkaXoCy0LPfn9tHmpMRpIP+ZGX8WRhJO3z4nUZKQ=";
      };
    };
  });
  meta = {
    description = "\n\n     image_transport should always be used to subscribe to and publish images. It provides transparent\n     support for transporting images in low-bandwidth compressed formats. Examples (provided by separate\n     plugin packages) include JPEG/PNG compression and Theora streaming video.\n\n  ";
  };
})
