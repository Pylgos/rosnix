{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  pcl,
  pcl_conversions,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    pcl_ros = substituteSource {
      src = fetchgit {
        name = "pcl_ros-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "8c3cf80f5f0348a1bf97305cba97b57a68d0ab0d";
        hash = "sha256-JYaF0rM0jptFPpMnfXIyQDMAwFXoG/ULAVW/d4/CVPs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pcl_ros";
  version = "2.6.1-3";
  src = sources.pcl_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs pcl pcl_conversions rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_ros launch_testing launch_testing_ros sensor_msgs ];
  missingDependencies = [ "libpcl-common" "libpcl-features" "libpcl-filters" "libpcl-io" "libpcl-segmentation" "libpcl-surface" ];
  meta = {
    description = "PCL (Point Cloud Library) ROS interface stack. PCL-ROS is the preferred bridge for 3D applications involving n-D Point Clouds and 3D geometry processing in ROS.";
  };
}
