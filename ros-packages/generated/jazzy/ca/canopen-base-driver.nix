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
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."canopen_base_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ canopen-core canopen-interfaces diagnostic-updater lely-core-libraries rclcpp-components std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_base_driver" = substituteSource {
      src = fetchgit {
        name = "canopen_base_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "2cdf9ae29ca7bcc7f4e9326da01c7e5a146b84ed";
        hash = "sha256-uZYC+CmQemBLnZOVbUc31XxpdehUs1Neker+/QUgpbs=";
      };
    };
  });
  meta = {
    description = "Library containing abstract CANopen driver class for ros2_canopen";
  };
})
