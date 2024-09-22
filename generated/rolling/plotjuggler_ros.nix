{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  plotjuggler,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  ros_environment,
  rosbag2,
  rosbag2_transport,
  substituteSource,
  tf2_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    plotjuggler_ros = substituteSource {
      src = fetchFromGitHub {
        name = "plotjuggler_ros-source";
        owner = "ros2-gbp";
        repo = "plotjuggler-ros-plugins-release";
        rev = "3498b0cebc478d3431d3382ac7e75dd3ded8b115";
        hash = "sha256-+d7GpqXlKqeQdqb5IGZB2Krc/uFEN9rqGmqn2o/2Bd4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plotjuggler_ros";
  version = "2.1.3-1";
  src = sources.plotjuggler_ros;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ plotjuggler rclcpp rcpputils rosbag2 rosbag2_transport tf2_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "binutils" "boost" "libqt5-svg-dev" "libqt5-websockets-dev" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "PlotJuggler plugin for ROS";
  };
}
