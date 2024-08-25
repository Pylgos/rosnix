{
  ament_cmake_ros,
  buildRosPackage,
  cv_bridge,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  message_filters,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  rtabmap_conversions,
  rtabmap_msgs,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_sync = substituteSource {
      src = fetchgit {
        name = "rtabmap_sync-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "0fb73881a470a5bc34724c36330ba679d5655975";
        hash = "sha256-13lwERfEWg8Suvpcc8KG0N2uR4sc0sQDx/ez9ejfXRI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_sync";
  version = "0.21.5-3";
  src = sources.rtabmap_sync;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge diagnostic_updater image_transport message_filters nav_msgs rclcpp rclcpp_components rtabmap_conversions rtabmap_msgs sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "RTAB-Map's synchronization package.";
  };
}
