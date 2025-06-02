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
  pname = "hls_lfcd_lds_driver";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."hls_lfcd_lds_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-system-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "hls_lfcd_lds_driver" = substituteSource {
      src = fetchgit {
        name = "hls_lfcd_lds_driver-source";
        url = "https://github.com/ros2-gbp/hls_lfcd_lds_driver-release.git";
        rev = "71ef161c372328c848f28206d98d82eac99abce5";
        hash = "sha256-qpQ1Ci7fMjeNFDc92Bwr3mZNq4ASJKJOPEvdeG48IeA=";
      };
    };
  });
  meta = {
    description = "\n    ROS package for LDS-01(HLS-LFCD2).\n    The LDS (Laser Distance Sensor) is a sensor sending the data to Host for the simultaneous localization and mapping (SLAM). Simultaneously the detecting obstacle data can also be sent to Host. HLDS(Hitachi-LG Data Storage) is developing the technology for the moving platform sensor such as Robot Vacuum Cleaners, Home Robot, Robotics Lawn Mower Sensor, etc.\n  ";
  };
})
