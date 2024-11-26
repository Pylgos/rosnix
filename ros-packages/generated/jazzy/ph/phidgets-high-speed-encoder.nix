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
  version = "2.3.3-2";
  src = finalAttrs.passthru.sources."phidgets_high_speed_encoder";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api phidgets-msgs rclcpp rclcpp-components sensor-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "phidgets_high_speed_encoder" = substituteSource {
        src = fetchgit {
          name = "phidgets_high_speed_encoder-source";
          url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
          rev = "a4e500c0e6d045bebe29ff6b1a27ca5159d4e5ad";
          hash = "sha256-+tQ+vw/pWTXBDexHIJi6YokVycAl8GdJSxKQ6Lxj39Y=";
        };
      };
    });
  };
  meta = {
    description = "Driver for the Phidgets high speed encoder devices";
  };
})
