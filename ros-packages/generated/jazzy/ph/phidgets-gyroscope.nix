{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  phidgets-api,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_gyroscope";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."phidgets_gyroscope";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs std-msgs std-srvs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_gyroscope" = substituteSource {
      src = fetchgit {
        name = "phidgets_gyroscope-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "9a4d596800e207b5e8244979fb38fb97ad249c43";
        hash = "sha256-9aLRhiutZEI1lMdnuHGVdYgTSyAExLFCOecaVNmlI5Q=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Gyroscope devices";
  };
})
