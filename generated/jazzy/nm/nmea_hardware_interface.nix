{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  controller_interface,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  hardware_interface,
  nmea_msgs,
  ouxt_lint_common,
  pluginlib,
  quaternion_operation,
  rclcpp,
  rclcpp_components,
  realtime_tools,
  ros2_control,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    nmea_hardware_interface = substituteSource {
      src = fetchgit {
        name = "nmea_hardware_interface-source";
        url = "https://github.com/ros2-gbp/nmea_hardware_interface-release.git";
        rev = "f2654a1aa9f22cabae90bb75c31680c3271d3a1d";
        hash = "sha256-YibMQpu2E/mEdOx3OB8wbxnUVH/AukvJlND3wu5+oeE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nmea_hardware_interface";
  version = "0.0.1-5";
  src = sources.nmea_hardware_interface;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller_interface geographic_msgs hardware_interface nmea_msgs pluginlib quaternion_operation rclcpp rclcpp_components realtime_tools ros2_control rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "gtk3" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ouxt_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros2 hardware interface for nmea_gps";
  };
}
