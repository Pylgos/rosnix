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
  version = "2.4.1-3";
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
        rev = "c00855d79592acd59254653d6a9ee9edba9a8283";
        hash = "sha256-4ImiMhycRm1L7KGBZe6yMmyRO4SpCLVAm4AHsMCXRiE=";
      };
    };
  });
  meta = {
    description = "Node that enables connected ROS-based devices or robots to exchange ROS messages via an MQTT broker using the MQTT protocol.";
  };
})
