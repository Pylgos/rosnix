{
  ament_cmake_ros,
  buildRosPackage,
  cv_bridge,
  diagnostic_updater,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  message_filters,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  rtabmap_conversions,
  rtabmap_msgs,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_sync = substituteSource {
      src = fetchFromGitHub {
        name = "rtabmap_sync-source";
        owner = "introlab";
        repo = "rtabmap_ros-release";
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
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge diagnostic_updater image_transport message_filters nav_msgs rclcpp rclcpp_components rtabmap_conversions rtabmap_msgs sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RTAB-Map's synchronization package.";
  };
}
