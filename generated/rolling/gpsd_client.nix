{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gps_msgs,
  gpsd,
  pkg-config,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    gpsd_client = substituteSource {
      src = fetchgit {
        name = "gpsd_client-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "3f85c0bfc8f40ef1245070b81463ab4b3184ffa2";
        hash = "sha256-Ssq5pihtdqJuy//6IfxXwaJCV1EC4X7urzYBOcONtjQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gpsd_client";
  version = "2.0.4-1";
  src = sources.gpsd_client;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gps_msgs gpsd rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "connects to a GPSd server and broadcasts GPS fixes using the NavSatFix message";
  };
}
