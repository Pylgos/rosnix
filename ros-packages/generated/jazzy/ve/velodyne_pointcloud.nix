{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  message_filters,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  velodyne_msgs,
}:
let
  sources = rec {
    velodyne_pointcloud-35739a33f8f260a755e03a4dfb6e170fca09b01e = substituteSource {
      src = fetchgit {
        name = "velodyne_pointcloud-35739a33f8f260a755e03a4dfb6e170fca09b01e-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "35739a33f8f260a755e03a4dfb6e170fca09b01e";
        hash = "sha256-hkvzuZw8cF8+XSVnSmlVOPLOTlg7vhtPoqd1gNK0mo8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_pointcloud";
  version = "2.3.0-4";
  src = sources.velodyne_pointcloud-35739a33f8f260a755e03a4dfb6e170fca09b01e;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles diagnostic_updater geometry_msgs message_filters rclcpp rclcpp_components sensor_msgs tf2 tf2_ros velodyne_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Point cloud conversions for Velodyne 3D LIDARs.";
  };
}
