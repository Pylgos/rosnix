{
  ament_cmake_python,
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    simple_launch = substituteSource {
      src = fetchgit {
        name = "simple_launch-source";
        url = "https://github.com/ros2-gbp/simple_launch-release.git";
        rev = "1f59783c83fbc769bcce5b61cd78b57bcdcdf905";
        hash = "sha256-qGRcyWgJ5d0NzsUAXpLLeRHBywF3IPhCiLyA5ZOLBqs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "simple_launch";
  version = "1.10.1-1";
  src = sources.simple_launch;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python launch launch_ros xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Python helper class for the ROS 2 launch system";
  };
}
