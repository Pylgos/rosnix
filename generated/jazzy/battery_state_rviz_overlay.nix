{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  rclcpp,
  rviz_2d_overlay_msgs,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    battery_state_rviz_overlay = substituteSource {
      src = fetchgit {
        name = "battery_state_rviz_overlay-source";
        url = "https://github.com/ros2-gbp/ros_battery_monitoring-release.git";
        rev = "83b60b8f64fc00ca4d63b6f7136ca1c65ea1f4b2";
        hash = "sha256-A61MKRfgwWoXT2grhLyskRsZlX0jDeFHTt4+Vl4eu4s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "battery_state_rviz_overlay";
  version = "1.0.0-1";
  src = sources.battery_state_rviz_overlay;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmt rclcpp rviz_2d_overlay_msgs sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Converts BatteryState messages to RViz OverlayText messages.";
  };
}
