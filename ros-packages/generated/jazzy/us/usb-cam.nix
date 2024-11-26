{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  camera-info-manager,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  image-transport-plugins,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "usb_cam";
  version = "0.8.1-1";
  src = finalAttrs.passthru.sources."usb_cam";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ builtin-interfaces camera-info-manager cv-bridge image-transport image-transport-plugins rclcpp rclcpp-components rosidl-default-runtime sensor-msgs std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" "v4l-utils" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "usb_cam" = substituteSource {
      src = fetchgit {
        name = "usb_cam-source";
        url = "https://github.com/ros2-gbp/usb_cam-release.git";
        rev = "9d2e5af7197f8021a289b5af78c7362eaf86fcb4";
        hash = "sha256-D4YStPBN+X8H0h6dWlVYgxuLYH5T7XWoyN0zLV5xN2E=";
      };
    };
  });
  meta = {
    description = "A ROS Driver for V4L USB Cameras";
  };
})
