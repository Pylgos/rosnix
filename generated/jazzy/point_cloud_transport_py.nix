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
        rev = "866093b8df9dd575ced356edd091f0b2e8f2df51";
        hash = "sha256-PfnHWd9RP3pnxe3ZTDPrDrNyLUzftfo1k8falKmeS2E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_transport_py";
  version = "4.0.2-1";
  src = sources.point_cloud_transport_py;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros python_cmake_module ];
  propagatedNativeBuildInputs = [ rpyutils ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib point_cloud_transport pybind11_vendor rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Python API for point_cloud_transport";
  };
}
