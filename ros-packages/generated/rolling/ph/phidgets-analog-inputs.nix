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
  version = "2.3.4-1";
  src = finalAttrs.passthru.sources."phidgets_analog_inputs";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ launch phidgets-api rclcpp rclcpp-components std-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_analog_inputs" = substituteSource {
      src = fetchgit {
        name = "phidgets_analog_inputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "128c58f7d2cf2ba842190b990f8e27ad71f7ccf4";
        hash = "sha256-wmRSkjsDYGkOgoTMuFxN33h9yGLMLLhBi2fqtCtvaaY=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Analog Input devices";
  };
})
