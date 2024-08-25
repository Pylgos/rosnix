{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  sensor_msgs,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    camera_calibration_parsers = substituteSource {
      src = fetchgit {
        name = "camera_calibration_parsers-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "07de0f00f55464e3c3ddbb662d24eed0e6b29281";
        hash = "sha256-wKn7KsxZviY/E9GTcDyMdCTVi7lAfKUWho7uaTIbx40=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_calibration_parsers";
  version = "5.1.4-1";
  src = sources.camera_calibration_parsers;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp sensor_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "camera_calibration_parsers contains routines for reading and writing camera calibration parameters.";
  };
}
