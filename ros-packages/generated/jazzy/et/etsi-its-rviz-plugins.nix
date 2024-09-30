{
  ament-cmake,
  buildRosPackage,
  etsi-its-msgs,
  etsi-its-msgs-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-ogre-vendor,
  rviz-rendering,
  rviz-satellite,
  rviz2,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "etsi_its_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "etsi_its_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "7afb1932d1e8ffc0bf29661d281c544aaada73aa";
        hash = "sha256-1PsO7RaqrI25xAc4Z7eZ0HIG+lwxJEQIPpBvse0KCQ8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "etsi_its_rviz_plugins";
  version = "2.2.0-1";
  src = sources."etsi_its_rviz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi-its-msgs etsi-its-msgs-utils pluginlib rclcpp rviz2 rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering rviz-satellite tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RViz plugin for ROS 2 messages based on ETSI ITS messages";
  };
}
