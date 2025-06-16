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
  version = "2.4.0-1";
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
        rev = "a926a20557660b42be2d8534fe7d9cfd1d2c6e1c";
        hash = "sha256-95Jqde50Dzx7+yPrO264is0jZ2I2kACwNLs32g7Yf9k=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Analog Output devices";
  };
})
