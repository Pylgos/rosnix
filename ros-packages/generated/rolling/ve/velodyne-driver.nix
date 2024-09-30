{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  velodyne-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "velodyne_driver" = substituteSource {
      src = fetchgit {
        name = "velodyne_driver-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "0c3d9f0ef24f36a7e6a11e3ef5be6c21e2990b62";
        hash = "sha256-9ysVDD9seg0Ss+VilOfbSs7ysVE2cxvVHaHR3kj+yKQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "velodyne_driver";
  version = "2.3.0-3";
  src = sources."velodyne_driver";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater rclcpp rclcpp-components tf2-ros velodyne-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcap" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS device driver for Velodyne 3D LIDARs.";
  };
}
