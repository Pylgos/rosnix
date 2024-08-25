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
  opencv,
  rclcpp,
  rclcpp_components,
  rcutils,
  sensor_msgs,
  substituteSource,
  tracetools_image_pipeline,
}:
let
  sources = rec {
    image_proc = substituteSource {
      src = fetchgit {
        name = "image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "da99ae6aa8c0154311d4738355e39ec3bc17f07f";
        hash = "sha256-58yDlPDDduWlj6XYldqZxrthoo+KDi3UVLSrkEnTvqg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_proc";
  version = "6.0.3-1";
  src = sources.image_proc;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers cv_bridge geometry_msgs image_geometry image_transport opencv rclcpp rclcpp_components rcutils sensor_msgs tracetools_image_pipeline ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Single image rectification and color processing.";
  };
}
