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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_analog_inputs";
  version = "2.3.3-2";
  src = finalAttrs.passthru.sources."phidgets_analog_inputs";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_analog_inputs" = substituteSource {
      src = fetchgit {
        name = "phidgets_analog_inputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "77dbe128a6d1d7999efd1d539305932e6b91ec80";
        hash = "sha256-cMwYeNmiFnip2gj4Ih+D+arDK2cxYuKHts79lM/mIVg=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Analog Input devices";
  };
})
