{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  motion-capture-tracking-interfaces,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
}:
let
  sources = mkSourceSet (sources: {
    "motion_capture_tracking" = substituteSource {
      src = fetchgit {
        name = "motion_capture_tracking-source";
        url = "https://github.com/ros2-gbp/motion_capture_tracking-release.git";
        rev = "42bccb83df2d4181678a85d158baf5f9a996a3fe";
        hash = "sha256-i4x1fFnItmyr13Kz2YfUYfYKcessV15UqBvrOb4Q41c=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "motion-capture-tracking";
  version = "1.0.3-3";
  src = sources."motion_capture_tracking";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ motion-capture-tracking-interfaces rclcpp sensor-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libpcl-all-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS Package for different motion capture systems, including custom rigid body tracking support";
  };
}
