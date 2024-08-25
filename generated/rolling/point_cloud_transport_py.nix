{
  ament_cmake_python,
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  point_cloud_transport,
  pybind11_vendor,
  python_cmake_module,
  rclcpp,
  rpyutils,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    point_cloud_transport_py = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_py-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport-release.git";
        rev = "49c807df7d677b7a6e2b27c339065743a10ea3d0";
        hash = "sha256-v+zx6s3LYmv2cZe4MlRIr+g6FhyaieqasQcsiBygONg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_transport_py";
  version = "5.0.3-1";
  src = sources.point_cloud_transport_py;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib point_cloud_transport pybind11_vendor rclcpp rpyutils sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Python API for point_cloud_transport";
  };
}
