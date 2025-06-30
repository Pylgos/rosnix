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
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."canopen_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ canopen-interfaces lely-core-libraries lifecycle-msgs rclcpp rclcpp-components rclcpp-lifecycle yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ canopen-interfaces lely-core-libraries lifecycle-msgs rclcpp rclcpp-components rclcpp-lifecycle yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_core" = substituteSource {
      src = fetchgit {
        name = "canopen_core-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "c20165416b795f742bf52b7ad1fb540f8ca5fada";
        hash = "sha256-lgV8kjXT8hz7/5ju8SyctDRQ4QNUzpGsgyCz4mKAxtw=";
      };
    };
  });
  meta = {
    description = "Core ros2_canopen functionalities such as DeviceContainer and master";
  };
})
