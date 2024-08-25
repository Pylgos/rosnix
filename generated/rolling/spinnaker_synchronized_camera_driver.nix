{
  ament_cmake,
  ament_cmake_black,
  ament_cmake_clang_format,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  spinnaker_camera_driver,
  substituteSource,
}:
let
  sources = rec {
    spinnaker_synchronized_camera_driver = substituteSource {
      src = fetchgit {
        name = "spinnaker_synchronized_camera_driver-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "7e6e393730d404731707617d6729da35ee03d1a6";
        hash = "sha256-00at/VcWxA8N7f7Y/CHRtm6A7EnyL3p5j1qVoksz4R4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "spinnaker_synchronized_camera_driver";
  version = "2.0.20-1";
  src = sources.spinnaker_synchronized_camera_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components spinnaker_camera_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_black ament_cmake_clang_format ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS2 driver for synchronized flir cameras using the Spinnaker SDK";
  };
}
