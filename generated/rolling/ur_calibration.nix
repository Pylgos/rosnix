{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  libyamlcpp,
  rclcpp,
  substituteSource,
  ur_client_library,
  ur_robot_driver,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ur_calibration = substituteSource {
      src = fetchgit {
        name = "ur_calibration-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "a785e4a4880ba558aad0d0e93e9229fb316d6ae4";
        hash = "sha256-410Rl8TRAnloqOIn/Ccg1B5ngk1HP5l6sDJI9xFer/Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_calibration";
  version = "2.4.9-1";
  src = sources.ur_calibration;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libyamlcpp rclcpp ur_client_library ur_robot_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Package for extracting the factory calibration from a UR robot and change it such that it can be used by ur_description to gain a correct URDF";
  };
}
