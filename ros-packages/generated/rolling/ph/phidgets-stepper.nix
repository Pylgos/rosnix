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
  version = "2.3.4-1";
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
        rev = "ca77580738d8c9ea4949833db36e262295359a46";
        hash = "sha256-A4tLtOTGrohKg7rMdc8nDL+VqsyL+8wAV7Xt6CPBywM=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Stepper devices";
  };
})
