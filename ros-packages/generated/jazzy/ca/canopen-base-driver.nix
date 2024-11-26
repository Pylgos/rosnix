{
  ament-cmake-ros,
  ament-lint-auto,
  buildAmentCmakePackage,
  canopen-core,
  canopen-interfaces,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  lely-core-libraries,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_base_driver";
  version = "0.2.9-2";
  src = finalAttrs.passthru.sources."canopen_base_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ canopen-core canopen-interfaces diagnostic-updater lely-core-libraries rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "canopen_base_driver" = substituteSource {
        src = fetchgit {
          name = "canopen_base_driver-source";
          url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
          rev = "ef623be7c9fcfa9e325e4a05fcdb0cfda9904565";
          hash = "sha256-okKOznu5KCRhv5byFy36jawqcLh98ZQB/VR7Jjkf8gw=";
        };
      };
    });
  };
  meta = {
    description = "Library containing abstract CANopen driver class for ros2_canopen";
  };
})
