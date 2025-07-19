{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "coin_d4_driver";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."coin_d4_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp rclcpp-lifecycle sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rclcpp-lifecycle sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "coin_d4_driver" = substituteSource {
      src = fetchgit {
        name = "coin_d4_driver-source";
        url = "https://github.com/ros2-gbp/coin_d4_driver-release.git";
        rev = "945a6b2bfa7f9c50f7860ba0056dc4aee58bab42";
        hash = "sha256-uncUTh0YzfZSG5+AjMhCdnJFk6rr6PP+X7R5/TeY6uw=";
      };
    };
  });
  meta = {
    description = "ROS package for LDS-03 (COIN-D4) Lidar";
  };
})
