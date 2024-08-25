{
  ament_cmake,
  buildRosPackage,
  controller_interface,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  realtime_tools,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    battery_state_broadcaster = substituteSource {
      src = fetchgit {
        name = "battery_state_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros_battery_monitoring-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_interface pluginlib realtime_tools sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS2 Control boradcaster for battery state sensors.";
  };
}
