{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  libpcap,
  rclcpp,
  rclcpp_components,
  substituteSource,
  tf2_ros,
  velodyne_msgs,
}:
let
  sources = rec {
    velodyne_driver = substituteSource {
      src = fetchgit {
        name = "velodyne_driver-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "273cef3d0cf5364e2fd8995a89d9339892219530";
        hash = "sha256-9ysVDD9seg0Ss+VilOfbSs7ysVE2cxvVHaHR3kj+yKQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_driver";
  version = "2.3.0-4";
  src = sources.velodyne_driver;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater libpcap rclcpp rclcpp_components tf2_ros velodyne_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS device driver for Velodyne 3D LIDARs.";
  };
}
