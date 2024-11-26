{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mqtt-client-interfaces,
  rclcpp,
  rclcpp-components,
  rcpputils,
  ros-environment,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mqtt_client";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."mqtt_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ mqtt-client-interfaces rclcpp rclcpp-components rcpputils std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "libpaho-mqtt-dev" "libpaho-mqttpp-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mqtt_client" = substituteSource {
      src = fetchgit {
        name = "mqtt_client-source";
        url = "https://github.com/ros2-gbp/mqtt_client-release.git";
        rev = "4b91cd4dcf7559b8fdc8c45bd4a4d621e2b31ffd";
        hash = "sha256-6PiP7jY7cdK3oodJirtS2kLQUyqVVn1Jp3eY8StfXls=";
      };
    };
  });
  meta = {
    description = "Node that enables connected ROS-based devices or robots to exchange ROS messages via an MQTT broker using the MQTT protocol.";
  };
})
