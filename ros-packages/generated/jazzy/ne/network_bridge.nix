{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "network_bridge" = substituteSource {
      src = fetchgit {
        name = "network_bridge-source";
        url = "https://github.com/ros2-gbp/network_bridge-release.git";
        rev = "c625bfef13c67072a1a39f37fc3859d5f3cfb27b";
        hash = "sha256-Gfm+jv0L73LlZMytVTDOCyqyBGqctp6URffWJU/opmk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "network_bridge";
  version = "1.0.2-1";
  src = sources."network_bridge";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib rclcpp std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" "libzstd-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch_testing launch_testing_ament_cmake launch_testing_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Allows for arbitrary network links (UDP, TCP, etc) to bridge ROS2 messages";
  };
}
