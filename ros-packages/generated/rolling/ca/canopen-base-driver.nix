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
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."canopen_base_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ canopen-core canopen-interfaces diagnostic-updater lely-core-libraries rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ canopen-core canopen-interfaces diagnostic-updater lely-core-libraries rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_base_driver" = substituteSource {
      src = fetchgit {
        name = "canopen_base_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "6ffde3e0de4b92b6c88553a08136852747d9341d";
        hash = "sha256-kVxivoTM7c6nL8t4z015Wz8HCzCkasMn5MvI7m+9V2U=";
      };
    };
  });
  meta = {
    description = "Library containing abstract CANopen driver class for ros2_canopen";
  };
})
