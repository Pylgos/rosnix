{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  class-loader,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "laser_proc";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."laser_proc";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ class-loader rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ class-loader rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "laser_proc" = substituteSource {
      src = fetchgit {
        name = "laser_proc-source";
        url = "https://github.com/ros2-gbp/laser_proc-release.git";
        rev = "db3550d1b6d8912db50d828d428b1522a8567b3a";
        hash = "sha256-pGxERcMl8AM4GDX7cp7dq5qFcziW4H4sAVaeRFdV5qY=";
      };
    };
  });
  meta = {
    description = "laser_proc";
  };
})
