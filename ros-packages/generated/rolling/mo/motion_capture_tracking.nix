{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  motion_capture_tracking_interfaces,
  rclcpp,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = mkSourceSet (sources: {
    "motion_capture_tracking" = substituteSource {
      src = fetchgit {
        name = "motion_capture_tracking-source";
        url = "https://github.com/ros2-gbp/motion_capture_tracking-release.git";
        rev = "6ce17d4d0b82379be6cdf4464085cded684562e5";
        hash = "sha256-i4x1fFnItmyr13Kz2YfUYfYKcessV15UqBvrOb4Q41c=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "motion_capture_tracking";
  version = "1.0.3-2";
  src = sources."motion_capture_tracking";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ motion_capture_tracking_interfaces rclcpp sensor_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libpcl-all-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS Package for different motion capture systems, including custom rigid body tracking support";
  };
}