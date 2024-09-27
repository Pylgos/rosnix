{
  ament_cmake_ros,
  buildRosPackage,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  ublox_msgs,
  ublox_serialization,
}:
let
  sources = rec {
    ublox_gps-ae61d1e2b33979bbdc84943ba3de2bdb16f4c0d8 = substituteSource {
      src = fetchgit {
        name = "ublox_gps-ae61d1e2b33979bbdc84943ba3de2bdb16f4c0d8-source";
        url = "https://github.com/ros2-gbp/ublox-release.git";
        rev = "ae61d1e2b33979bbdc84943ba3de2bdb16f4c0d8";
        hash = "sha256-reZXChxPuNCtJNjWaATs7ozW63ldzYenGz4KQv8rJ1M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_gps";
  version = "2.3.0-3";
  src = sources.ublox_gps-ae61d1e2b33979bbdc84943ba3de2bdb16f4c0d8;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater geometry_msgs rcl_interfaces rclcpp rclcpp_components sensor_msgs std_msgs tf2 ublox_msgs ublox_serialization ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driver for u-blox GPS devices.";
  };
}
