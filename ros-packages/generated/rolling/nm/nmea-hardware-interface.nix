{
  ament-cmake,
  ament-lint-auto,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "nmea_hardware_interface" = substituteSource {
      src = fetchgit {
        name = "nmea_hardware_interface-source";
        url = "https://github.com/ros2-gbp/nmea_hardware_interface-release.git";
        rev = "5a1ca492359d33e9d69fd0829c56e9d0b6b42f3d";
        hash = "sha256-YibMQpu2E/mEdOx3OB8wbxnUVH/AukvJlND3wu5+oeE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nmea-hardware-interface";
  version = "0.0.1-4";
  src = sources."nmea_hardware_interface";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller-interface geographic-msgs hardware-interface nmea-msgs pluginlib quaternion-operation rclcpp rclcpp-components realtime-tools ros2-control rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "gtk3" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ouxt-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros2 hardware interface for nmea_gps";
  };
}