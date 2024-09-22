{
  ament_cmake_python,
  ament_cmake_ros,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  point_cloud_transport,
  pybind11_vendor,
  python_cmake_module,
  rclcpp,
  rosSystemPackages,
  rpyutils,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    point_cloud_transport_py = substituteSource {
      src = fetchFromGitHub {
        name = "point_cloud_transport_py-source";
        owner = "ros2-gbp";
        repo = "point_cloud_transport-release";
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
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib point_cloud_transport pybind11_vendor rclcpp rpyutils sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Python API for point_cloud_transport";
  };
}
