{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_pytest,
  ament_cmake_uncrustify,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_cmake_module,
  rclcpp,
  rclpy,
  sensor_msgs,
  sensor_msgs_py,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    laser_geometry = substituteSource {
      src = fetchgit {
        name = "laser_geometry-source";
        url = "https://github.com/ros2-gbp/laser_geometry-release.git";
        rev = "004f7d0e382692374c1c5eef8e0dcda2e1a7c93c";
        hash = "sha256-L14Scv0jSh8t5x8vxSwxFJR6fIc45Ze2YKXzMc/Wp/I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "laser_geometry";
  version = "2.8.0-1";
  src = sources.laser_geometry;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3Packages.numpy rclcpp rclpy sensor_msgs sensor_msgs_py tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_gtest ament_cmake_lint_cmake ament_cmake_pytest ament_cmake_uncrustify python_cmake_module ];
  missingDependencies = [  ];
  meta = {
    description = "This package contains a class for converting from a 2D laser scan as defined by sensor_msgs/LaserScan into a point cloud as defined by sensor_msgs/PointCloud or sensor_msgs/PointCloud2. In particular, it contains functionality to account for the skew resulting from moving robots or tilting laser scanners.";
  };
}
