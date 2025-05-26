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
  version = "2.3.4-1";
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
        rev = "3fefc0744ac5765a2f6ef81db29d7c9872a51ac9";
        hash = "sha256-A49/hmq7prnn03teok+0V8LBSzp7bP03RI4fK+X5Zy8=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Analog Output devices";
  };
})
