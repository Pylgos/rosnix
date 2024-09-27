{
  ament_cmake_python,
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    simple_launch-f48f8e0af3e7f45795f209cbc2b8d403f950c9fe = substituteSource {
      src = fetchgit {
        name = "simple_launch-f48f8e0af3e7f45795f209cbc2b8d403f950c9fe-source";
        url = "https://github.com/ros2-gbp/simple_launch-release.git";
        rev = "f48f8e0af3e7f45795f209cbc2b8d403f950c9fe";
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
  src = sources.simple_launch-f48f8e0af3e7f45795f209cbc2b8d403f950c9fe;
  nativeBuildInputs = [ ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python launch launch_ros xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Python helper class for the ROS 2 launch system";
  };
}
