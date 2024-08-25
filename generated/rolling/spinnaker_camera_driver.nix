{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_info_manager,
  curl,
  dpkg,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg,
  flir_camera_msgs,
  image_transport,
  libusb1,
  libyamlcpp,
  python3Packages,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    spinnaker_camera_driver = substituteSource {
      src = fetchgit {
        name = "spinnaker_camera_driver-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "d20097a76ba1542f0040176a9ec50755c8788835";
        hash = "sha256-MTLkSEO/NkdU6Fa/1zhCvcWbcyRFQ58qqX66+pGBmdk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "spinnaker_camera_driver";
  version = "2.0.20-1";
  src = sources.spinnaker_camera_driver;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager dpkg ffmpeg flir_camera_msgs image_transport libusb1 libyamlcpp python3Packages.distro rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_clang_format ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS2 driver for flir spinnaker sdk";
  };
}
