{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildRosPackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  velodyne-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "velodyne_pointcloud" = substituteSource {
      src = fetchgit {
        name = "velodyne_pointcloud-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "d11c91eb9d18e83ee33133cecb4fc1737d5140f6";
        hash = "sha256-hkvzuZw8cF8+XSVnSmlVOPLOTlg7vhtPoqd1gNK0mo8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "velodyne-pointcloud";
  version = "2.3.0-3";
  src = sources."velodyne_pointcloud";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles diagnostic-updater geometry-msgs message-filters rclcpp rclcpp-components sensor-msgs tf2 tf2-ros velodyne-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Point cloud conversions for Velodyne 3D LIDARs.";
  };
}