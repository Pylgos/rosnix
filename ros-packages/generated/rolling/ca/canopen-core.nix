{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  canopen-interfaces,
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
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_core";
  version = "0.2.12-2";
  src = finalAttrs.passthru.sources."canopen_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ canopen-interfaces lely-core-libraries lifecycle-msgs rclcpp rclcpp-components rclcpp-lifecycle yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "canopen_core" = substituteSource {
        src = fetchgit {
          name = "canopen_core-source";
          url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
          rev = "23063f5f0371cb8c8d997c7a00cb5a1b2a6e6303";
          hash = "sha256-fYhg6RaztX+p+lFzVCRADsxQLq4G0yuwwDPIjyYoVbg=";
        };
      };
    });
  };
  meta = {
    description = "Core ros2_canopen functionalities such as DeviceContainer and master";
  };
})
