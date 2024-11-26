{
  ament-cmake-ros,
  ament-lint-auto,
  buildAmentCmakePackage,
  canopen-base-driver,
  canopen-core,
  canopen-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
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
  pname = "canopen_proxy_driver";
  version = "0.2.9-2";
  src = finalAttrs.passthru.sources."canopen_proxy_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ canopen-base-driver canopen-core canopen-interfaces rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_proxy_driver" = substituteSource {
      src = fetchgit {
        name = "canopen_proxy_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "d5c0e9c04f634b1cada8a043355ee09a13fd294e";
        hash = "sha256-QwLvJwY8xrI+FKlIKORTwDnTRlrWA8r1hx7IQbDoTmA=";
      };
    };
  });
  meta = {
    description = "Simple proxy driver for the ros2_canopen stack";
  };
})
