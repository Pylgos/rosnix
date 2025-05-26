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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_high_speed_encoder";
  version = "2.3.4-1";
  src = finalAttrs.passthru.sources."phidgets_high_speed_encoder";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ launch phidgets-api phidgets-msgs rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api phidgets-msgs rclcpp rclcpp-components sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_high_speed_encoder" = substituteSource {
      src = fetchgit {
        name = "phidgets_high_speed_encoder-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "50d7b575361d69c19490d1734e505ea080876d9c";
        hash = "sha256-BsKtXnknHFWNDONpeR9799qgpdOztu+HycudQA7CTPU=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets high speed encoder devices";
  };
})
