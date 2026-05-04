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
  off-highway-general-purpose-radar-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_general_purpose_radar";
  version = "1.3.0-2";
  src = finalAttrs.passthru.sources."off_highway_general_purpose_radar";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ can-msgs off-highway-can off-highway-general-purpose-radar-msgs rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs off-highway-can off-highway-general-purpose-radar-msgs rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-ros ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_general_purpose_radar" = substituteSource {
      src = fetchgit {
        name = "off_highway_general_purpose_radar-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "ec6526fefbcc5595da34df7b0c3db0a280df4155";
        hash = "sha256-t/wxqwKGHz2WGF+bRPVZ3bjCuU/763cjYot6TTMRmTo=";
      };
    };
  });
  meta = {
    description = "The off_highway_general_purpose_radar package";
  };
})
