{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  mqtt_client_interfaces,
  rclcpp,
  rclcpp_components,
  rcpputils,
  ros_environment,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    mqtt_client = substituteSource {
      src = fetchgit {
        name = "mqtt_client-source";
        url = "https://github.com/ros2-gbp/mqtt_client-release.git";
        rev = "34964f34dae7ee98f8693d8f87142678b11e3763";
        hash = "sha256-6PiP7jY7cdK3oodJirtS2kLQUyqVVn1Jp3eY8StfXls=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mqtt_client";
  version = "2.3.0-1";
  src = sources.mqtt_client;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmt mqtt_client_interfaces rclcpp rclcpp_components rcpputils std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "libpaho-mqtt-dev" "libpaho-mqttpp-dev" ];
  meta = {
    description = "Node that enables connected ROS-based devices or robots to exchange ROS messages via an MQTT broker using the MQTT protocol.";
  };
}
