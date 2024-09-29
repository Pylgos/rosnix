{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  asio_cmake_module,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  io_context,
  lifecycle_msgs,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rosSystemPackages,
  std_msgs,
  substituteSource,
  udp_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "udp_driver" = substituteSource {
      src = fetchgit {
        name = "udp_driver-source";
        url = "https://github.com/ros2-gbp/transport_drivers-release.git";
        rev = "6687fb0cf8866979dffca6fdea7dd91244cb24d9";
        hash = "sha256-ufshq3ku5f0OLD1L+CJhsfg8tSqLiOzmXueZGXDO9+4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "udp_driver";
  version = "1.2.0-3";
  src = sources."udp_driver";
  nativeBuildInputs = [ ament_cmake_auto asio_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ io_context lifecycle_msgs rclcpp rclcpp_components rclcpp_lifecycle std_msgs udp_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A library to write Synchronous and Asynchronous networking applications, ROS and ROS2 nodes";
  };
}