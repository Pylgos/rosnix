{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  controller_interface,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  gtk3,
  hardware_interface,
  nmea_msgs,
  ouxt_lint_common,
  pkg-config,
  pluginlib,
  python3Packages,
  quaternion_operation,
  rclcpp,
  rclcpp_components,
  realtime_tools,
  ros2_control,
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
        rev = "5a1ca492359d33e9d69fd0829c56e9d0b6b42f3d";
        hash = "sha256-YibMQpu2E/mEdOx3OB8wbxnUVH/AukvJlND3wu5+oeE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nmea_hardware_interface";
  version = "0.0.1-4";
  src = sources.nmea_hardware_interface;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_interface geographic_msgs gtk3 hardware_interface nmea_msgs pluginlib python3Packages.boost quaternion_operation rclcpp rclcpp_components realtime_tools ros2_control rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ouxt_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ros2 hardware interface for nmea_gps";
  };
}
