{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-info-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  flir-camera-msgs,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "spinnaker_camera_driver";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."spinnaker_camera_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ros-environment ];
  propagatedNativeBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  propagatedBuildInputs = [ camera-info-manager flir-camera-msgs image-transport rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "dpkg" "ffmpeg" "libusb-1.0-dev" "python3-distro" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "spinnaker_camera_driver" = substituteSource {
      src = fetchgit {
        name = "spinnaker_camera_driver-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "252d1092dd28e018acde744f6050edd9f4e9ef18";
        hash = "sha256-nZ+V4IZhdhdQ71ZqVX0lHcuKLtAaA8v6UE+1XMsBa/o=";
      };
    };
  });
  meta = {
    description = "ROS2 driver for flir spinnaker sdk";
  };
})
