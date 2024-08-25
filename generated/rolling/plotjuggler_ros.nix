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
