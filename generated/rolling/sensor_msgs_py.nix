{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    sensor_msgs_py = substituteSource {
      src = fetchgit {
        name = "sensor_msgs_py-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "01387914c80c8a75bea8b032db9310c0370c49eb";
        hash = "sha256-XP+WzJwxIGpqQshcoZ61DxDJNyXp3xOiZNQgFDC328M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sensor_msgs_py";
  version = "5.4.1-1";
  src = sources.sensor_msgs_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.numpy sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "A package for easy creation and reading of PointCloud2 messages in Python.";
  };
}
