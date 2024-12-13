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
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."canopen_proxy_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ canopen-base-driver canopen-core canopen-interfaces rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_proxy_driver" = substituteSource {
      src = fetchgit {
        name = "canopen_proxy_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "0c35a2b739fc0c41c4b1908d31424b8c97eb747e";
        hash = "sha256-/sotDHFRCTZOrpuT/bcZ+KxALJiS9CKfTAI0otXeNHA=";
      };
    };
  });
  meta = {
    description = "Simple proxy driver for the ros2_canopen stack";
  };
})
