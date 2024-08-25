{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ros_environment = substituteSource {
      src = fetchgit {
        name = "ros_environment-source";
        url = "https://github.com/ros2-gbp/ros_environment-release.git";
        rev = "cfb36f6e53a770b4b31a053b82dfc0dec648b685";
        hash = "sha256-dwFnwm7ilNij7JeJ7sBPii3MX2KZVS3uvMBD8MJpIag=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_environment";
  version = "4.2.1-1";
  src = sources.ros_environment;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The package provides the environment variables `ROS_VERSION` and `ROS_DISTRO`.";
  };
}
