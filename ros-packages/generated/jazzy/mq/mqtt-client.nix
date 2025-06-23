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
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mqtt_client";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."mqtt_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ mqtt-client-interfaces rclcpp rclcpp-components rcpputils std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "libpaho-mqtt-dev" "libpaho-mqttpp-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mqtt-client-interfaces rclcpp rclcpp-components rcpputils std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "libpaho-mqtt-dev" "libpaho-mqttpp-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mqtt_client" = substituteSource {
      src = fetchgit {
        name = "mqtt_client-source";
        url = "https://github.com/ros2-gbp/mqtt_client-release.git";
        rev = "fb79c6e0c9373066be892b09115f362c148dd4cf";
        hash = "sha256-SJ2IMjPwOvqvczKfutZ2eq0J7O3xCPivGicpGnJYjm0=";
      };
    };
  });
  meta = {
    description = "Node that enables connected ROS-based devices or robots to exchange ROS messages via an MQTT broker using the MQTT protocol.";
  };
})
