{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  plotjuggler,
  rclcpp,
  rcpputils,
  ros-environment,
  rosSystemPackages,
  rosbag2,
  rosbag2-transport,
  substituteSource,
  tf2-msgs,
  tf2-ros,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "plotjuggler_ros" = substituteSource {
      src = fetchgit {
        name = "plotjuggler_ros-source";
        url = "https://github.com/ros2-gbp/plotjuggler-ros-plugins-release.git";
        rev = "e31f1220d72fc2f17ef195073827140644390fed";
        hash = "sha256-ulay40u10VuTXLPe/c8xBf5qxL1TR6D03Fb1uRYaoAw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "plotjuggler-ros";
  version = "2.1.2-2";
  src = sources."plotjuggler_ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ plotjuggler rclcpp rcpputils rosbag2 rosbag2-transport tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "binutils" "boost" "libqt5-svg-dev" "libqt5-websockets-dev" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "PlotJuggler plugin for ROS";
  };
}