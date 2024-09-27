{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  ur_client_library,
  ur_robot_driver,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ur_calibration-b5f3add1c5a2654c9be3f599c89774d21ca738a6 = substituteSource {
      src = fetchgit {
        name = "ur_calibration-b5f3add1c5a2654c9be3f599c89774d21ca738a6-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "b5f3add1c5a2654c9be3f599c89774d21ca738a6";
        hash = "sha256-d2ek8nVlx5QQoQ0uMymAT3D8QaFaqGsEgzv7G4iXBWw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_calibration";
  version = "2.4.10-1";
  src = sources.ur_calibration-b5f3add1c5a2654c9be3f599c89774d21ca738a6;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp ur_client_library ur_robot_driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package for extracting the factory calibration from a UR robot and change it such that it can be used by ur_description to gain a correct URDF";
  };
}
