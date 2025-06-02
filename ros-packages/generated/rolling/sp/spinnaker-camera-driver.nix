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
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."spinnaker_camera_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ros-environment ];
  propagatedNativeBuildInputs = [ camera-info-manager flir-camera-msgs image-transport rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "dpkg" "ffmpeg" "libusb-1.0-dev" "python3-distro" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ camera-info-manager flir-camera-msgs image-transport rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "curl" "dpkg" "ffmpeg" "libusb-1.0-dev" "python3-distro" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "spinnaker_camera_driver" = substituteSource {
      src = fetchgit {
        name = "spinnaker_camera_driver-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "7dcea3941ddcfadf6da6a3f27e8b419ff0e602ff";
        hash = "sha256-bUAI0uIpma0ciHGKtonV7FL27Fyk0JgRiz4Qi5ftpwI=";
      };
    };
  });
  meta = {
    description = "ROS2 driver for flir spinnaker sdk";
  };
})
