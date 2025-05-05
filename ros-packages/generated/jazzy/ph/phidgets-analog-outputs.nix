{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  phidgets-api,
  phidgets-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_analog_outputs";
  version = "2.3.3-2";
  src = finalAttrs.passthru.sources."phidgets_analog_outputs";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ phidgets-api phidgets-msgs rclcpp rclcpp-components std-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ phidgets-api phidgets-msgs rclcpp rclcpp-components std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_analog_outputs" = substituteSource {
      src = fetchgit {
        name = "phidgets_analog_outputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "f515b9e4933159442a9fc7e3004abd5b1896f1eb";
        hash = "sha256-xi78W37HY59f/oeBUwFQpdqmfHhjmVubarF16PXOWiM=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Analog Output devices";
  };
})
