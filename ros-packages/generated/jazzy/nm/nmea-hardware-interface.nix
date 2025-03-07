{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  controller-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  hardware-interface,
  mkSourceSet,
  nmea-msgs,
  ouxt-lint-common,
  pluginlib,
  quaternion-operation,
  rclcpp,
  rclcpp-components,
  realtime-tools,
  ros2-control,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nmea_hardware_interface";
  version = "0.0.1-5";
  src = finalAttrs.passthru.sources."nmea_hardware_interface";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ controller-interface geographic-msgs hardware-interface nmea-msgs pluginlib quaternion-operation rclcpp rclcpp-components realtime-tools ros2-control rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "gtk3" ]; };
  checkInputs = [ ament-lint-auto ouxt-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nmea_hardware_interface" = substituteSource {
      src = fetchgit {
        name = "nmea_hardware_interface-source";
        url = "https://github.com/ros2-gbp/nmea_hardware_interface-release.git";
        rev = "f2654a1aa9f22cabae90bb75c31680c3271d3a1d";
        hash = "sha256-YibMQpu2E/mEdOx3OB8wbxnUVH/AukvJlND3wu5+oeE=";
      };
    };
  });
  meta = {
    description = "ros2 hardware interface for nmea_gps";
  };
})
