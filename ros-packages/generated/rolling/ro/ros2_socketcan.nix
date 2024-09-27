{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  can_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  ros2_socketcan_msgs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ros2_socketcan-3bf434b06d9791787e58a0b855b6cfccd982d140 = substituteSource {
      src = fetchgit {
        name = "ros2_socketcan-3bf434b06d9791787e58a0b855b6cfccd982d140-source";
        url = "https://github.com/ros2-gbp/ros2_socketcan-release.git";
        rev = "3bf434b06d9791787e58a0b855b6cfccd982d140";
        hash = "sha256-+pXj+cTr4khaX16vO9udW9wG0Acdjndi7NydrNL2uZo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_socketcan";
  version = "1.3.0-1";
  src = sources.ros2_socketcan-3bf434b06d9791787e58a0b855b6cfccd982d140;
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ can_msgs lifecycle_msgs rclcpp rclcpp_components rclcpp_lifecycle ros2_socketcan_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Simple wrapper around SocketCAN";
  };
}
