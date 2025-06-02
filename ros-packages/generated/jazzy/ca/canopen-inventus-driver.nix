{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  canopen,
  canopen-base-driver,
  canopen-core,
  canopen-interfaces,
  canopen-inventus-interfaces,
  canopen-master-driver,
  canopen-proxy-driver,
  fetchgit,
  fetchurl,
  fetchzip,
  lely-core-libraries,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_inventus_driver";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."canopen_inventus_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ canopen canopen-base-driver canopen-core canopen-interfaces canopen-inventus-interfaces canopen-master-driver canopen-proxy-driver lely-core-libraries lifecycle-msgs rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-msgs std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ canopen canopen-base-driver canopen-core canopen-interfaces canopen-inventus-interfaces canopen-master-driver canopen-proxy-driver lely-core-libraries lifecycle-msgs rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-msgs std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_inventus_driver" = substituteSource {
      src = fetchgit {
        name = "canopen_inventus_driver-source";
        url = "https://github.com/clearpath-gbp/canopen_inventus-release.git";
        rev = "6353840169ef8dbf3ea648c8477f674972e96b0a";
        hash = "sha256-9HhFp6nxvqq75NJJNGAyuZiIGD7puVU7fQcHWQH7CRo=";
      };
    };
  });
  meta = {
    description = "ros2_canopen implementation of Inventus BMS driver";
  };
})
