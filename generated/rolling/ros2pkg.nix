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
        rev = "9e91f8b6683ac216c08a18be3e3142d1aa04f7d9";
        hash = "sha256-nherNPpJx1pcZEbS3RPwB3rqNKXsjqZw6xdth1sxBmo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2pkg";
  version = "0.34.1-1";
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
