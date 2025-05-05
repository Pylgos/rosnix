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
  version = "2.3.3-2";
  src = finalAttrs.passthru.sources."phidgets_magnetometer";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp-components sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_magnetometer" = substituteSource {
      src = fetchgit {
        name = "phidgets_magnetometer-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "c3be132b5cbcf62e2eabc71c39be8314811d9c9a";
        hash = "sha256-3Ggm9kmzc70h+9ehA3T5rBXPWdUFeWN5ptgZJMeh+sk=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Magnetometer devices";
  };
})
