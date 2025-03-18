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
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."hls_lfcd_lds_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "hls_lfcd_lds_driver" = substituteSource {
      src = fetchgit {
        name = "hls_lfcd_lds_driver-source";
        url = "https://github.com/ros2-gbp/hls_lfcd_lds_driver-release.git";
        rev = "3c582dbc257f0ebf7629c2a256c28314fab21597";
        hash = "sha256-OdRrjDmRtsetvk1xPct5UMMtKhFQDbIcGgf4iax8TbI=";
      };
    };
  });
  meta = {
    description = "ROS package for LDS-01(HLS-LFCD2). The LDS (Laser Distance Sensor) is a sensor sending the data to Host for the simultaneous localization and mapping (SLAM). Simultaneously the detecting obstacle data can also be sent to Host. HLDS(Hitachi-LG Data Storage) is developing the technology for the moving platform sensor such as Robot Vacuum Cleaners, Home Robot, Robotics Lawn Mower Sensor, etc.";
  };
})
