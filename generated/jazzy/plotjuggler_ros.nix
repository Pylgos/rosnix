{
  ament_cmake,
  binutils,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  plotjuggler,
  python3Packages,
  qt5,
  rclcpp,
  rcpputils,
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
      src = fetchgit {
        name = "plotjuggler_ros-source";
        url = "https://github.com/ros2-gbp/plotjuggler-ros-plugins-release.git";
        rev = "e31f1220d72fc2f17ef195073827140644390fed";
        hash = "sha256-ulay40u10VuTXLPe/c8xBf5qxL1TR6D03Fb1uRYaoAw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plotjuggler_ros";
  version = "2.1.2-2";
  src = sources.plotjuggler_ros;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ binutils plotjuggler python3Packages.boost qt5.qtbase qt5.qtsvg qt5.qtwebsockets rclcpp rcpputils rosbag2 rosbag2_transport tf2_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "PlotJuggler plugin for ROS";
  };
}
