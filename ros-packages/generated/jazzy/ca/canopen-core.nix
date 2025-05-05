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
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."canopen_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ canopen-interfaces lely-core-libraries lifecycle-msgs rclcpp-components yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_core" = substituteSource {
      src = fetchgit {
        name = "canopen_core-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "f7a444124f57d4375a631b51a070a3d7265696aa";
        hash = "sha256-6RiD5C8wwMDrjJbV9yk8NCJde8guHK0Ieh7XUy7R/n0=";
      };
    };
  });
  meta = {
    description = "Core ros2_canopen functionalities such as DeviceContainer and master";
  };
})
