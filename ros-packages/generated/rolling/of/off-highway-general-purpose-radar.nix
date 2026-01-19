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
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_general_purpose_radar";
  version = "1.1.0-2";
  src = finalAttrs.passthru.sources."off_highway_general_purpose_radar";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ can-msgs off-highway-can off-highway-general-purpose-radar-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-all-dev" "libpcl-common" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs off-highway-can off-highway-general-purpose-radar-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" "libpcl-common" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto ament-lint-common pcl-ros ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_general_purpose_radar" = substituteSource {
      src = fetchgit {
        name = "off_highway_general_purpose_radar-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "db5139bc088b0be3350371d2e2ea38be61003e25";
        hash = "sha256-MJSqpNytA0Rn5EyuXlkq7AYdQ6WTcoP5meK7Rb/GuSc=";
      };
    };
  });
  meta = {
    description = "The off_highway_general_purpose_radar package";
  };
})
