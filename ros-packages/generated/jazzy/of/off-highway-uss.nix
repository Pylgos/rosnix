{
  ament-cmake,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  can-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  off-highway-can,
  off-highway-uss-msgs,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_uss";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."off_highway_uss";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ can-msgs off-highway-can off-highway-uss-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-all-dev" "libpcl-common" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs off-highway-can off-highway-uss-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" "libpcl-common" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto ament-lint-common pcl-ros ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_uss" = substituteSource {
      src = fetchgit {
        name = "off_highway_uss-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "d76b61a3097018c9498c539e3a4db770f0d35c10";
        hash = "sha256-rxjpKGwcy6i/9zVNK2+aQ7+p8Bz8Ore4BlFr6VsVyZY=";
      };
    };
  });
  meta = {
    description = "The off_highway_uss package";
  };
})
