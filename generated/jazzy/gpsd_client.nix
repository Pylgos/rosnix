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
        rev = "16e02a0573ebaf6c2fe0b131285c43ccccfb49d4";
        hash = "sha256-5UEXqwcIMfl3tStPrZyLbVOdaoRcW2YuUtkSzCQZhmo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gpsd_client";
  version = "2.0.3-2";
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
