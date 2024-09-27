{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp_action,
  rcutils,
  rosSystemPackages,
  ros_gz_interfaces,
  sensor_msgs,
  std_msgs,
  substituteSource,
  turtlebot4_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot4_gz_toolbox" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_gz_toolbox-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "3e2d92b6aa372a77377035236af275b906ef6e6e";
        hash = "sha256-YT2pTTYGkZ7/W8jP+6UWzRfWVoaYbyRcY5C5AcqJKRo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "turtlebot4_gz_toolbox";
  version = "2.0.1-1";
  src = sources."turtlebot4_gz_toolbox";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_action rcutils ros_gz_interfaces sensor_msgs std_msgs turtlebot4_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Turtlebot4 Gazebo Toolbox";
  };
}
