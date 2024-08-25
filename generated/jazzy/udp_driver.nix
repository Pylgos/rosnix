{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  asio,
  asio_cmake_module,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  io_context,
  lifecycle_msgs,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  std_msgs,
  substituteSource,
  udp_msgs,
}:
let
  sources = rec {
    udp_driver = substituteSource {
      src = fetchgit {
        name = "udp_driver-source";
        url = "https://github.com/ros2-gbp/transport_drivers-release.git";
        rev = "de1037c5bdee946ffc06ca634e2fd26f1333528a";
        hash = "sha256-ufshq3ku5f0OLD1L+CJhsfg8tSqLiOzmXueZGXDO9+4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "udp_driver";
  version = "1.2.0-4";
  src = sources.udp_driver;
  nativeBuildInputs = [ ament_cmake_auto asio_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ asio io_context lifecycle_msgs rclcpp rclcpp_components rclcpp_lifecycle std_msgs udp_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A library to write Synchronous and Asynchronous networking applications, ROS and ROS2 nodes";
  };
}
