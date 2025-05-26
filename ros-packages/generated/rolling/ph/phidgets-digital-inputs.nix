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
  version = "2.3.4-1";
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
        rev = "d101577da564c0249896493f259bc58663546422";
        hash = "sha256-QLQj85h7Cz5DyL4s3ej0/rKrr3raZZt6/3ZuVzh2qn8=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets Digital Input devices";
  };
})
