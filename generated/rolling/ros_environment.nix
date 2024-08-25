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
        rev = "b475ce549478c96fc257d4e6972ff1dc826cc33b";
        hash = "sha256-89KnNs/zSjc8CUp8tpoXh/YqEY+4zvPZAC5plw7aGCg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_environment";
  version = "4.3.0-1";
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
