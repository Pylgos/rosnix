{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ros_environment-b475ce549478c96fc257d4e6972ff1dc826cc33b = substituteSource {
      src = fetchgit {
        name = "ros_environment-b475ce549478c96fc257d4e6972ff1dc826cc33b-source";
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
  src = sources.ros_environment-b475ce549478c96fc257d4e6972ff1dc826cc33b;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The package provides the environment variables `ROS_VERSION` and `ROS_DISTRO`.";
  };
}
