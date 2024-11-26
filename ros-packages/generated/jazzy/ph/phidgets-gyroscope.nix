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
  version = "2.3.3-2";
  src = finalAttrs.passthru.sources."phidgets_gyroscope";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs std-msgs std-srvs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "phidgets_gyroscope" = substituteSource {
        src = fetchgit {
          name = "phidgets_gyroscope-source";
          url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
          rev = "72021452c01dbeab059587f5315966915cd0d4af";
          hash = "sha256-umLPYnGNeRNHzYU1z5tXxDJe/QFYAnmXCCPxLFH4E5U=";
        };
      };
    });
  };
  meta = {
    description = "Driver for the Phidgets Gyroscope devices";
  };
})
