{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-agnocast-wrapper,
  autoware-cmake,
  autoware-lint-common,
  autoware-localization-util,
  autoware-utils-diagnostics,
  autoware-utils-geometry,
  autoware-utils-logging,
  autoware-utils-tf,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_gyro_odometer";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_gyro_odometer";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-agnocast-wrapper autoware-localization-util autoware-utils-diagnostics autoware-utils-geometry autoware-utils-logging autoware-utils-tf diagnostic-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-agnocast-wrapper autoware-localization-util autoware-utils-diagnostics autoware-utils-geometry autoware-utils-logging autoware-utils-tf diagnostic-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_gyro_odometer" = substituteSource {
      src = fetchgit {
        name = "autoware_gyro_odometer-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "2b22d8cd582ba76f9e9b8bd69eccec05b85a30bb";
        hash = "sha256-1Gt4VHU8h7rnmRlGC5RBqmiDHQ/m547MjK05PTpgPbI=";
      };
    };
  });
  meta = {
    description = "The autoware_gyro_odometer package as a ROS 2 node";
  };
})
