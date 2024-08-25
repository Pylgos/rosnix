{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
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
        rev = "6c3323e5153a1c9c6dd9f54bdbbb039fde31873a";
        hash = "sha256-RyIafHfr3e2zSJlKB8OoYweMJErq7q9KrJqK/fGSmLo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sensor_msgs_py";
  version = "5.3.5-1";
  src = sources.sensor_msgs_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "A package for easy creation and reading of PointCloud2 messages in Python.";
  };
}
