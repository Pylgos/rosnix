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
  version = "1.1.4-1";
  src = finalAttrs.passthru.sources."ld08_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "libudev-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libudev-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ld08_driver" = substituteSource {
      src = fetchgit {
        name = "ld08_driver-source";
        url = "https://github.com/ros2-gbp/ld08_driver-release.git";
        rev = "56ed27b88a056b5a1169b5de82942b358b8f8c3b";
        hash = "sha256-C+gZEw2ZbEV31Zvt/zo3/MTKJo0jmWKqk0pfcGx1aT4=";
      };
    };
  });
  meta = {
    description = "\n    ROS package for LDS-02(LD08) Lidar.\n    The Lidar sensor sends data to the Host controller for the Simultaneous Localization And Mapping(SLAM).\n  ";
  };
})
