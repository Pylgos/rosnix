{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_lint_auto,
  apriltag,
  apriltag_msgs,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    apriltag_ros = substituteSource {
      src = fetchgit {
        name = "apriltag_ros-source";
        url = "https://github.com/ros2-gbp/apriltag_ros-release.git";
        rev = "1f0ff6ec7df749994976a6c7df51b3bfdf954763";
        hash = "sha256-1BAPfaLgYZ+JV3LFidzL5IOnM4wd7fvcXNRkAzCyZU4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_ros";
  version = "3.2.2-1";
  src = sources.apriltag_ros;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ apriltag apriltag_msgs cv_bridge image_transport rclcpp rclcpp_components sensor_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_cmake_cppcheck ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "AprilTag detection node";
  };
}
