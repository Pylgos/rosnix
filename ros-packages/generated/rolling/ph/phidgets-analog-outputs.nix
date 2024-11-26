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
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."phidgets_analog_outputs";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ phidgets-api phidgets-msgs rclcpp rclcpp-components std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "phidgets_analog_outputs" = substituteSource {
        src = fetchgit {
          name = "phidgets_analog_outputs-source";
          url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
          rev = "59e5913311216077f491d0545d7633bc6d19d107";
          hash = "sha256-xi78W37HY59f/oeBUwFQpdqmfHhjmVubarF16PXOWiM=";
        };
      };
    });
  };
  meta = {
    description = "Driver for the Phidgets Analog Output devices";
  };
})
