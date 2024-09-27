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
  rosSystemPackages,
  spinnaker_camera_driver,
  substituteSource,
}:
let
  sources = rec {
    spinnaker_synchronized_camera_driver-35e568dc85cd1e7f018ed43e0fee98b7399419c8 = substituteSource {
      src = fetchgit {
        name = "spinnaker_synchronized_camera_driver-35e568dc85cd1e7f018ed43e0fee98b7399419c8-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "35e568dc85cd1e7f018ed43e0fee98b7399419c8";
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
  src = sources.spinnaker_synchronized_camera_driver-35e568dc85cd1e7f018ed43e0fee98b7399419c8;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components spinnaker_camera_driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_black ament_cmake_clang_format ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 driver for synchronized flir cameras using the Spinnaker SDK";
  };
}
