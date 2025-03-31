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
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."ld08_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libudev-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ld08_driver" = substituteSource {
      src = fetchgit {
        name = "ld08_driver-source";
        url = "https://github.com/ros2-gbp/ld08_driver-release.git";
        rev = "96ce0b3574e8dfe66c1f41722b3849d3534e489e";
        hash = "sha256-wsSsWlbzz6QF3DIi4vLl3x459NW+gUQzreq4T1OqQr4=";
      };
    };
  });
  meta = {
    description = "ROS package for LDS-02(LD08) Lidar. The Lidar sensor sends data to the Host controller for the Simultaneous Localization And Mapping(SLAM).";
  };
})
