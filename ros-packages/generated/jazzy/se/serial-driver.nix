{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  asio-cmake-module,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  io-context,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "serial_driver";
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."serial_driver";
  nativeBuildInputs = [ ament-cmake-auto asio-cmake-module ];
  propagatedBuildInputs = [ io-context rclcpp rclcpp-components rclcpp-lifecycle std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "serial_driver" = substituteSource {
        src = fetchgit {
          name = "serial_driver-source";
          url = "https://github.com/ros2-gbp/transport_drivers-release.git";
          rev = "cf792907df67d7d479e8c5bd069e0a148657da03";
          hash = "sha256-1Oc6jtsGEX0Jaxqs7jdlxu/nZJxZPxvagRST+L9bdwI=";
        };
      };
    });
  };
  meta = {
    description = "A template class and associated utilities which encapsulate basic reading from serial ports";
  };
})
