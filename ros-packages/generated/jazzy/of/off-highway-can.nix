{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  can-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros2-socketcan-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_can";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."off_highway_can";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ can-msgs diagnostic-updater rclcpp ros2-socketcan-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs diagnostic-updater rclcpp ros2-socketcan-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_can" = substituteSource {
      src = fetchgit {
        name = "off_highway_can-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "124ec4aabf6670f80c7a006fb830a492ee1f1d7e";
        hash = "sha256-LRY92X9MTi4KTXSApKLQ52EJfqHsfWVoiZ0vflUHNbo=";
      };
    };
  });
  meta = {
    description = "The off_highway_can package";
  };
})
