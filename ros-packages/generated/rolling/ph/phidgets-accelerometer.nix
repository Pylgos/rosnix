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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_accelerometer";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."phidgets_accelerometer";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_accelerometer" = substituteSource {
      src = fetchgit {
        name = "phidgets_accelerometer-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "41572a3eb0859146b94a1a6b8d00568a6f6c3238";
        hash = "sha256-n67meToobs7UjIZD2wOckhr3agFm7lVHWykPlZdb3zA=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Accelerometer devices";
  };
})
