{
  ament-cmake-ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-conversions,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rtabmap-conversions,
  rtabmap-msgs,
  rviz-common,
  rviz-default-plugins,
  rviz-rendering,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rtabmap_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "rtabmap_rviz_plugins-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "750b6e20a84a8b219576070925f9b702f747fd0f";
        hash = "sha256-Ym++aQZELnnolLYuvqRmWnuNRIB8vXO01qD/f8m1obs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rtabmap_rviz_plugins";
  version = "0.21.5-3";
  src = sources."rtabmap_rviz_plugins";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pcl-conversions pluginlib rclcpp rtabmap-conversions rtabmap-msgs rviz-common rviz-default-plugins rviz-rendering sensor-msgs std-msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RTAB-Map's rviz plugins.";
  };
}
