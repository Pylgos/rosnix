{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-index-cpp,
  buildRosPackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  launch-testing-ament-cmake,
  message-filters,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-msgs,
  moveit-resources-panda-moveit-config,
  moveit-ros-occupancy-map-monitor,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  ros-testing,
  rosSystemPackages,
  srdfdom,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-msgs,
  tf2-ros,
  urdf,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_ros_planning" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_planning-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "c11121878648022aee751c9c630ce7c4c23bad3e";
        hash = "sha256-QIve6UhlfaK/LyaV9NXlCGWoBgbaFNCYq2vU0nq+wW4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_ros_planning";
  version = "2.11.0-1";
  src = sources."moveit_ros_planning";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-cpp generate-parameter-library message-filters moveit-common moveit-core moveit-msgs moveit-ros-occupancy-map-monitor pluginlib rclcpp rclcpp-action rclcpp-components srdfdom std-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-msgs tf2-ros urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest launch-testing-ament-cmake moveit-configs-utils moveit-resources-panda-moveit-config ros-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Planning components of MoveIt that use ROS";
  };
}
