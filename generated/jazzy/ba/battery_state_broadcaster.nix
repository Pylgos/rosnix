{
  ament_cmake,
  buildRosPackage,
  controller_interface,
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
    battery_state_broadcaster-e524fc46c70f55c6dc99857564279390e1291ffb = substituteSource {
      src = fetchgit {
        name = "battery_state_broadcaster-e524fc46c70f55c6dc99857564279390e1291ffb-source";
        url = "https://github.com/ros2-gbp/ros_battery_monitoring-release.git";
        rev = "e524fc46c70f55c6dc99857564279390e1291ffb";
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
  src = sources.battery_state_broadcaster-e524fc46c70f55c6dc99857564279390e1291ffb;
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
