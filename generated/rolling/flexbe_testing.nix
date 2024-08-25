{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe_core,
  flexbe_msgs,
  launch_ros,
  launch_testing,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    flexbe_testing = substituteSource {
      src = fetchgit {
        name = "flexbe_testing-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "f133f26b3bfba21d43e842e30be708a566ed1355";
        hash = "sha256-Z8v7JR6IuSmak5toK1AzflLXgHOoa40m9WxX883LZ7w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_testing";
  version = "3.0.3-1";
  src = sources.flexbe_testing;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs launch_ros rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_copyright ament_flake8 ament_pep257 launch_testing python3Packages.pytest std_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "flexbe_testing provides a framework for unit testing states.";
  };
}
