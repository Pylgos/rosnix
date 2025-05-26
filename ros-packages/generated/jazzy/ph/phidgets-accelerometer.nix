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
  version = "2.3.4-1";
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
        rev = "5d271646f706fee45dbb026696e30b943cda33b9";
        hash = "sha256-4XIJ66tsInOauPzV2z+WmY3Dsy9gn6Jr1E2ViLAHRA4=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Accelerometer devices";
  };
})
