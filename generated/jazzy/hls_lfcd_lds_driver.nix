{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    hls_lfcd_lds_driver = substituteSource {
      src = fetchgit {
        name = "hls_lfcd_lds_driver-source";
        url = "https://github.com/ros2-gbp/hls_lfcd_lds_driver-release.git";
        rev = "43116c85f64ac8288dd6fb013e81b3fcf98d9bad";
        hash = "sha256-gFslT2HGpW6SzRM8frU8D/gistcJDw02YkcZTXZcfa8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hls_lfcd_lds_driver";
  version = "2.0.4-6";
  src = sources.hls_lfcd_lds_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS package for LDS(HLS-LFCD2). The LDS (Laser Distance Sensor) is a sensor sending the data to Host for the simultaneous localization and mapping (SLAM). Simultaneously the detecting obstacle data can also be sent to Host. HLDS(Hitachi-LG Data Storage) is developing the technology for the moving platform sensor such as Robot Vacuum Cleaners, Home Robot, Robotics Lawn Mower Sensor, etc.";
  };
}
