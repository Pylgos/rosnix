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
  version = "0.2.9-2";
  src = finalAttrs.passthru.sources."canopen_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ canopen-interfaces lely-core-libraries lifecycle-msgs rclcpp rclcpp-components rclcpp-lifecycle yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_core" = substituteSource {
      src = fetchgit {
        name = "canopen_core-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "4121a85cba89840b28dfa6a7a0737946e3418555";
        hash = "sha256-FGvB62WkL47PY/x3FNDlblrjJJWiKutqhX/flTV/z9Q=";
      };
    };
  });
  meta = {
    description = "Core ros2_canopen functionalities such as DeviceContainer and master";
  };
})
