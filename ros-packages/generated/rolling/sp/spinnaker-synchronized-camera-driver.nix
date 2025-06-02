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
  version = "3.0.2-1";
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
        rev = "272f871145b67bd2e0cae358a202d35c16d16fba";
        hash = "sha256-0j4SVHZwkP6shuwNJBrvgZbH/P7Si30n+KrvCV0RjTk=";
      };
    };
  });
  meta = {
    description = "ROS2 driver for synchronized flir cameras using the Spinnaker SDK";
  };
})
