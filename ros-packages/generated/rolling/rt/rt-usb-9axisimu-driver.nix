{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rt_usb_9axisimu_driver";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."rt_usb_9axisimu_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "rt_usb_9axisimu_driver" = substituteSource {
      src = fetchgit {
        name = "rt_usb_9axisimu_driver-source";
        url = "https://github.com/ros2-gbp/rt_usb_9axisimu_driver-release.git";
        rev = "0e636255d21dd8ad6370b2294ea60f7a07575a66";
        hash = "sha256-xDU5E4JFurs4//vIizExSFf5WzK5ko5Q1ASBUKZkuHI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/eranpeer/FakeIt";
          to = "URL ${sources."rt_usb_9axisimu_driver/FakeIt"}";
        }
      ];
    };
    "rt_usb_9axisimu_driver/FakeIt" = substituteSource {
      src = fetchgit {
        name = "FakeIt-source";
        url = "https://github.com/eranpeer/FakeIt";
        rev = "cb39d8a053876f74dfeed66dd335d3041f142095";
        hash = "sha256-hjw0eEJ5ZWPfqQuIgINAuIglgxPju/8RjDKeu6LN8bw=";
      };
    };
  });
  meta = {
    description = "The rt_usb_9axisimu_driver package";
  };
})
