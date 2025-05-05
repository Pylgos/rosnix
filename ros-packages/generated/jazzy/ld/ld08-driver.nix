{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ld08_driver";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."ld08_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libudev-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ld08_driver" = substituteSource {
      src = fetchgit {
        name = "ld08_driver-source";
        url = "https://github.com/ros2-gbp/ld08_driver-release.git";
        rev = "c6f43db382d34c62ce562892efbe5a613142c5b2";
        hash = "sha256-J13f9eQcZNX5WtvJwY+3h/6q+TFaLFAkqROAquApRlM=";
      };
    };
  });
  meta = {
    description = "ROS package for LDS-02(LD08) Lidar. The Lidar sensor sends data to the Host controller for the Simultaneous Localization And Mapping(SLAM).";
  };
})
