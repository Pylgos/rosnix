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
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  substituteSource,
  tf2_ros,
  velodyne_msgs,
}:
let
  sources = rec {
    velodyne_driver-0c3d9f0ef24f36a7e6a11e3ef5be6c21e2990b62 = substituteSource {
      src = fetchgit {
        name = "velodyne_driver-0c3d9f0ef24f36a7e6a11e3ef5be6c21e2990b62-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "0c3d9f0ef24f36a7e6a11e3ef5be6c21e2990b62";
        hash = "sha256-9ysVDD9seg0Ss+VilOfbSs7ysVE2cxvVHaHR3kj+yKQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_driver";
  version = "2.3.0-3";
  src = sources.velodyne_driver-0c3d9f0ef24f36a7e6a11e3ef5be6c21e2990b62;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater rclcpp rclcpp_components tf2_ros velodyne_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcap" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS device driver for Velodyne 3D LIDARs.";
  };
}
