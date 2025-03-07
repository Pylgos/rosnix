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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_digital_outputs";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."phidgets_digital_outputs";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api phidgets-msgs rclcpp rclcpp-components std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_digital_outputs" = substituteSource {
      src = fetchgit {
        name = "phidgets_digital_outputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "19a417adb7755b9c791486703491c84a77a2e5af";
        hash = "sha256-KupijHg2trBRdHREmgsrAmrCxE0f+hnvA6BJOjIZ1Yc=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Digital Output devices";
  };
})
