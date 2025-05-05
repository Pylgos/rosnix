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
  pname = "phidgets_digital_inputs";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."phidgets_digital_inputs";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp-components std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_digital_inputs" = substituteSource {
      src = fetchgit {
        name = "phidgets_digital_inputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "4e0bff5c3ff7cda09615ff7e1e110b3a5bb52fac";
        hash = "sha256-taMmD3Mb/CxQDtrkT5cyYYpsjvqCfhPtQH88w96/tto=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Digital Input devices";
  };
})
