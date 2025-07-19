{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  phidgets-api,
  phidgets-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_stepper";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."phidgets_stepper";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ launch phidgets-api phidgets-msgs rclcpp rclcpp-components sensor-msgs std-msgs std-srvs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api phidgets-msgs rclcpp rclcpp-components sensor-msgs std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_stepper" = substituteSource {
      src = fetchgit {
        name = "phidgets_stepper-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "a6edb3ddb357d64a92a8d086022553b7e19012ec";
        hash = "sha256-AKxe6UDQI1JrNdtRq7PD3REszmUkONUvzet3v5ysw6U=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Stepper devices";
  };
})
