{
  ament-cmake-ros,
  ament-lint-auto,
  buildAmentCmakePackage,
  canopen-base-driver,
  canopen-core,
  canopen-interfaces,
  canopen-proxy-driver,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_402_driver";
  version = "0.2.12-2";
  src = finalAttrs.passthru.sources."canopen_402_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ canopen-base-driver canopen-core canopen-interfaces canopen-proxy-driver rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "canopen_402_driver" = substituteSource {
        src = fetchgit {
          name = "canopen_402_driver-source";
          url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
          rev = "31f116fdfffe916d3a85196d90bd00a602ce0fc3";
          hash = "sha256-3e2q7BXoyMladOHb7nm1zkYY7NPtmzvWcQVM/LddZtA=";
        };
      };
    });
  };
  meta = {
    description = "Driiver for devices implementing CIA402 profile";
  };
})
