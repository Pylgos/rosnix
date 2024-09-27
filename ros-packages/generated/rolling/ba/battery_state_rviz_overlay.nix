{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  rviz_2d_overlay_msgs,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    battery_state_rviz_overlay-3440c215e463be37cb5f6c309babe8089d2d2151 = substituteSource {
      src = fetchgit {
        name = "battery_state_rviz_overlay-3440c215e463be37cb5f6c309babe8089d2d2151-source";
        url = "https://github.com/ros2-gbp/ros_battery_monitoring-release.git";
        rev = "3440c215e463be37cb5f6c309babe8089d2d2151";
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
  src = sources.battery_state_rviz_overlay-3440c215e463be37cb5f6c309babe8089d2d2151;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rviz_2d_overlay_msgs sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Converts BatteryState messages to RViz OverlayText messages.";
  };
}
