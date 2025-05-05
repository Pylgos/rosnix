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
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."canopen_402_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ canopen-base-driver canopen-core canopen-interfaces canopen-proxy-driver rclcpp-components sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_402_driver" = substituteSource {
      src = fetchgit {
        name = "canopen_402_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "9039e401b7545c8295a6b136b012af48af226abd";
        hash = "sha256-QlKyzYmKY4b1yrwUSxVi5Y6pTM5NOKBJjT0GRH7MPhc=";
      };
    };
  });
  meta = {
    description = "Driiver for devices implementing CIA402 profile";
  };
})
