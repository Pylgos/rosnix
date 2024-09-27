{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mqtt_client_interfaces,
  rclcpp,
  rclcpp_components,
  rcpputils,
  rosSystemPackages,
  ros_environment,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    mqtt_client-4b91cd4dcf7559b8fdc8c45bd4a4d621e2b31ffd = substituteSource {
      src = fetchgit {
        name = "mqtt_client-4b91cd4dcf7559b8fdc8c45bd4a4d621e2b31ffd-source";
        url = "https://github.com/ros2-gbp/mqtt_client-release.git";
        rev = "4b91cd4dcf7559b8fdc8c45bd4a4d621e2b31ffd";
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
  src = sources.mqtt_client-4b91cd4dcf7559b8fdc8c45bd4a4d621e2b31ffd;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mqtt_client_interfaces rclcpp rclcpp_components rcpputils std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "libpaho-mqtt-dev" "libpaho-mqttpp-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Node that enables connected ROS-based devices or robots to exchange ROS messages via an MQTT broker using the MQTT protocol.";
  };
}
