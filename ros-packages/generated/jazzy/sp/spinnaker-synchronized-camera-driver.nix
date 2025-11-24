{
  ament-cmake,
  ament-cmake-black,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  spinnaker-camera-driver,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "spinnaker_synchronized_camera_driver";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."spinnaker_synchronized_camera_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components spinnaker-camera-driver ];
  buildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp rclcpp-components spinnaker-camera-driver ];
  checkInputs = [ ament-cmake-black ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "spinnaker_synchronized_camera_driver" = substituteSource {
      src = fetchgit {
        name = "spinnaker_synchronized_camera_driver-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "1853a3a6e97a274cf7e96ef7c55cb00ab18cafd5";
        hash = "sha256-v2ZDUUXvptnzclz6yZb3EqtqF40cmOXuRcsvmDnAjj8=";
      };
    };
  });
  meta = {
    description = "ROS2 driver for synchronized flir cameras using the Spinnaker SDK";
  };
})
