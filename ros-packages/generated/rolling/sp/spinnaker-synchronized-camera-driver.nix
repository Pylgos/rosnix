{
  ament-cmake,
  ament-cmake-black,
  ament-cmake-clang-format,
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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."spinnaker_synchronized_camera_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components spinnaker-camera-driver ];
  checkInputs = [ ament-cmake-black ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "spinnaker_synchronized_camera_driver" = substituteSource {
      src = fetchgit {
        name = "spinnaker_synchronized_camera_driver-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "ba9e9f0356f64dca6d0837bdb9b6677d7a6fb43e";
        hash = "sha256-RIibVom6w6HpnXQJmj0ZOw8rDids49aCM9F6AYfZpWw=";
      };
    };
  });
  meta = {
    description = "ROS2 driver for synchronized flir cameras using the Spinnaker SDK";
  };
})
