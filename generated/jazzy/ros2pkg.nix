{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  ros2cli,
  substituteSource,
}:
let
  sources = rec {
    ros2pkg = substituteSource {
      src = fetchgit {
        name = "ros2pkg-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "1cfd8c26024f1bb5696e6389ee7197e137b90ec8";
        hash = "sha256-g+sC73+O+uYoTYMGSauFm+Q4+0Y/Nwfaldpou5TGQO8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2pkg";
  version = "0.32.1-1";
  src = sources.ros2pkg;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_copyright buildPackages.python3Packages.catkin-pkg buildPackages.python3Packages.empy buildPackages.python3Packages.importlib-resources ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python python3Packages.setuptools ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_flake8 ament_pep257 ament_xmllint launch launch_testing launch_testing_ros python3Packages.pytest python3Packages.pytest-timeout ];
  missingDependencies = [  ];
  meta = {
    description = "The pkg command for ROS 2 command line tools.";
  };
}
