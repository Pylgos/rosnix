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
  version = "2.4.0-1";
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
        rev = "bcaa8ca3e57c5ea0f231e047b7e2dd1d32bb9a80";
        hash = "sha256-h0UENBi8RmQoXxyqBBYAKGDl5+OUYYYZIR+bUG3ytEs=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Analog Input devices";
  };
})
