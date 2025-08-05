{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rc-common-msgs,
  rc-genicam-api,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  stereo-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rc_genicam_driver";
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."rc_genicam_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-updater image-transport rc-common-msgs rc-genicam-api rclcpp rclcpp-components sensor-msgs stereo-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-updater image-transport rc-common-msgs rc-genicam-api rclcpp rclcpp-components sensor-msgs stereo-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "rc_genicam_driver" = substituteSource {
      src = fetchgit {
        name = "rc_genicam_driver-source";
        url = "https://github.com/ros2-gbp/rc_genicam_driver_ros2-release.git";
        rev = "5d65073efb39f2559e82ed05baab6d9d9ce48277";
        hash = "sha256-Msi1LCB2nsbhamOw1ynVs5nNfLSQr8/WuL9TR9BIUXE=";
      };
    };
  });
  meta = {
    description = "Driver for rc_visard and rc_cube from Roboception GmbH";
  };
})
