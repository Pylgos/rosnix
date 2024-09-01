{
  ament_cmake,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gflags,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_sim_vendor,
  gz_transport_vendor,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  pkg-config,
  rclcpp,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ros_gz_sim = substituteSource {
      src = fetchgit {
        name = "ros_gz_sim-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "8c3ad6b5d8dc95447333a1ae693544dc0e9cde7b";
        hash = "sha256-FoRu+Y1cHe74E4jeWffOy6YumycexOfzGyIbn4DEeHM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_sim";
  version = "1.0.4-1";
  src = sources.ros_gz_sim;
  nativeBuildInputs = [ ament_cmake pkg-config wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python gflags gz_math_vendor gz_msgs_vendor gz_sim_vendor gz_transport_vendor rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common launch_ros launch_testing launch_testing_ament_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Tools for using Gazebo Sim simulation with ROS.";
  };
}
