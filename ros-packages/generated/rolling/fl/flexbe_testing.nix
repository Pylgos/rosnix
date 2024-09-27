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
  rclpy,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    flexbe_testing-f133f26b3bfba21d43e842e30be708a566ed1355 = substituteSource {
      src = fetchgit {
        name = "flexbe_testing-f133f26b3bfba21d43e842e30be708a566ed1355-source";
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
  src = sources.flexbe_testing-f133f26b3bfba21d43e842e30be708a566ed1355;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ flexbe_core flexbe_msgs launch_ros rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_copyright ament_flake8 ament_pep257 launch_testing std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "flexbe_testing provides a framework for unit testing states.";
  };
}
