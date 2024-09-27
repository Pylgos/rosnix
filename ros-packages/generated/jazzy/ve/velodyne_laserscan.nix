{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    velodyne_laserscan-45af76c98be872e120796c9000e764a74205521d = substituteSource {
      src = fetchgit {
        name = "velodyne_laserscan-45af76c98be872e120796c9000e764a74205521d-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "45af76c98be872e120796c9000e764a74205521d";
        hash = "sha256-rSKlfJVrsBMOdfguEVxqRmL3bNJiRLJsyy6iTcxdfKY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_laserscan";
  version = "2.3.0-4";
  src = sources.velodyne_laserscan-45af76c98be872e120796c9000e764a74205521d;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Extract a single ring of a Velodyne PointCloud2 and publish it as a LaserScan message";
  };
}
