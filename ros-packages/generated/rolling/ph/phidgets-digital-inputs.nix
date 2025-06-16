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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."phidgets_digital_inputs";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ launch phidgets-api rclcpp rclcpp-components std-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_digital_inputs" = substituteSource {
      src = fetchgit {
        name = "phidgets_digital_inputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "acd0a1dfaaa826b5a51a0fd0aff694bde20f1601";
        hash = "sha256-l2lilnGaJBVTWF3by+zHH8iAd5d/nJJ2YgICiMRIneo=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Digital Input devices";
  };
})
