{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_calibration_parsers,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_geometry,
  image_transport,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rcutils,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tracetools_image_pipeline,
}:
let
  sources = mkSourceSet (sources: {
    "image_proc" = substituteSource {
      src = fetchgit {
        name = "image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "4ada1f984eac6d7c4ad344a4a21e2c6deaa9239a";
        hash = "sha256-xZz0f71QzrLefyF9yRF15bTJZ3VSMj5ZQIdv9z1EeXI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "image_proc";
  version = "5.0.4-1";
  src = sources."image_proc";
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera_calibration_parsers cv_bridge geometry_msgs image_geometry image_transport rclcpp rclcpp_components rcutils sensor_msgs tracetools_image_pipeline ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Single image rectification and color processing.";
  };
}
