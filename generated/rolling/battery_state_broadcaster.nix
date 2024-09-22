{
  ament_cmake,
  buildRosPackage,
  controller_interface,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  realtime_tools,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    battery_state_broadcaster = substituteSource {
      src = fetchFromGitHub {
        name = "battery_state_broadcaster-source";
        owner = "ros2-gbp";
        repo = "ros_battery_monitoring-release";
        rev = "0d64cba7565af1681c145bd00be7bd87a8b4b744";
        hash = "sha256-ynQossur/wBDAwdNLaf0DVCZVv6fkXa6OyEyCrDtoWs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "battery_state_broadcaster";
  version = "1.0.0-1";
  src = sources.battery_state_broadcaster;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller_interface pluginlib realtime_tools sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 Control boradcaster for battery state sensors.";
  };
}
