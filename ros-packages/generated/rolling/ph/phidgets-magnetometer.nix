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
  pname = "phidgets_magnetometer";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."phidgets_magnetometer";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_magnetometer" = substituteSource {
      src = fetchgit {
        name = "phidgets_magnetometer-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "713de4948a1b7f236e0f4fa18b3b83d770363fd8";
        hash = "sha256-Og9Y6ust3AhiwlGe0Fn7V2qrMwZSIfvTz3mZAX9YuNU=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Magnetometer devices";
  };
})
