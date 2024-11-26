{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  velodyne-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "velodyne_driver";
  version = "2.5.1-1";
  src = finalAttrs.passthru.sources."velodyne_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ diagnostic-updater rclcpp rclcpp-components tf2-ros velodyne-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcap" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "velodyne_driver" = substituteSource {
      src = fetchgit {
        name = "velodyne_driver-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "785711121f89673901382a02ecc035fbc04b177c";
        hash = "sha256-EEA0OQ2KQU5mB8doCIzWuG3oCeYiq0HG7KKfn9xeRr0=";
      };
    };
  });
  meta = {
    description = "ROS device driver for Velodyne 3D LIDARs.";
  };
})
