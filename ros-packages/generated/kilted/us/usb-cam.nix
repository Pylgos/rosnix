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
  version = "0.8.1-2";
  src = finalAttrs.passthru.sources."usb_cam";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces camera-info-manager cv-bridge image-transport image-transport-plugins rclcpp rclcpp-components ros-environment rosidl-default-runtime sensor-msgs std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ffmpeg" "v4l-utils" ]; };
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces camera-info-manager cv-bridge image-transport image-transport-plugins rclcpp rclcpp-components ros-environment rosidl-default-runtime sensor-msgs std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" "v4l-utils" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "usb_cam" = substituteSource {
      src = fetchgit {
        name = "usb_cam-source";
        url = "https://github.com/ros2-gbp/usb_cam-release.git";
        rev = "580389e7b6f129f271d10910ee84dd320ee989ce";
        hash = "sha256-D4YStPBN+X8H0h6dWlVYgxuLYH5T7XWoyN0zLV5xN2E=";
      };
    };
  });
  meta = {
    description = "A ROS Driver for V4L USB Cameras";
  };
})
