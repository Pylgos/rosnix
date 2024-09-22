{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  laser_geometry,
  launch,
  launch_ros,
  message_filters,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  tf2_sensor_msgs,
}:
let
  sources = rec {
    pointcloud_to_laserscan = substituteSource {
      src = fetchgit {
        name = "pointcloud_to_laserscan-source";
        url = "https://github.com/ros2-gbp/pointcloud_to_laserscan-release.git";
        rev = "f1cea776ee8801bc6833e635f83efcbc9a589d73";
        hash = "sha256-qr3WavBoAsGaLii5dCMmNk764fMGdISwf7EAd5q14MQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pointcloud_to_laserscan";
  version = "2.0.2-2";
  src = sources.pointcloud_to_laserscan;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ laser_geometry launch launch_ros message_filters rclcpp rclcpp_components sensor_msgs tf2 tf2_ros tf2_sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_pep257 ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Converts a 3D Point Cloud into a 2D laser scan. This is useful for making devices like the Kinect appear like a laser scanner for 2D-based algorithms (e.g. laser-based SLAM).";
  };
}
