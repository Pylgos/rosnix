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
  version = "2.4.0-1";
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
        rev = "cbb69adfd69914b9cba6a98ed627204d43ba81f1";
        hash = "sha256-QXJQ/8IqB/QMBES9Z6PZjK6Y4a046KYgW7xXDhd4bsU=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Accelerometer devices";
  };
})
