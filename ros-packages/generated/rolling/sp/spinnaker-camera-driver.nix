{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-info-manager,
  diagnostic-updater,
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
  version = "3.0.5-1";
  src = finalAttrs.passthru.sources."spinnaker_camera_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ros-environment ];
  propagatedNativeBuildInputs = [ camera-info-manager diagnostic-updater flir-camera-msgs image-transport rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "dpkg" "ffmpeg" "libomp-dev" "libusb-1.0-dev" "python3-distro" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ camera-info-manager diagnostic-updater flir-camera-msgs image-transport rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "curl" "dpkg" "ffmpeg" "libomp-dev" "libusb-1.0-dev" "python3-distro" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "spinnaker_camera_driver" = substituteSource {
      src = fetchgit {
        name = "spinnaker_camera_driver-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "2e71689c8a657f13ee8fa12342e7efa3cf50e479";
        hash = "sha256-Sg4A0OACPfMIrbD5luWtmOtvjYCcSdQmKAHPqIeelNE=";
      };
    };
  });
  meta = {
    description = "ROS2 driver for flir spinnaker sdk";
  };
})
