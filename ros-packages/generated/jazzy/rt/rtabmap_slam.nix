{
  ament_cmake_ros,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  rtabmap_msgs,
  rtabmap_sync,
  rtabmap_util,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_ros,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_slam-271d7374296cfcd4362c66996515bb0554a5c846 = substituteSource {
      src = fetchgit {
        name = "rtabmap_slam-271d7374296cfcd4362c66996515bb0554a5c846-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "271d7374296cfcd4362c66996515bb0554a5c846";
        hash = "sha256-nM9+z9mrpkCrnnJSVLJUYIuweXDJspZHX8o0EmZCrvU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_slam";
  version = "0.21.5-3";
  src = sources.rtabmap_slam-271d7374296cfcd4362c66996515bb0554a5c846;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge geometry_msgs nav_msgs rclcpp rclcpp_components rtabmap_msgs rtabmap_sync rtabmap_util sensor_msgs std_msgs std_srvs tf2 tf2_ros visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RTAB-Map's SLAM package.";
  };
}
