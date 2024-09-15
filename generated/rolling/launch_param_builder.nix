{
  ament_copyright,
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    launch_param_builder = substituteSource {
      src = fetchgit {
        name = "launch_param_builder-source";
        url = "https://github.com/ros2-gbp/launch_param_builder-release.git";
        rev = "b9145c2de22b34398e95e98611218b7da38f4b3b";
        hash = "sha256-5wzPO7Vg6sA7heEmRxiLcDbilS5YyieLi8fBrtcJe/g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_param_builder";
  version = "0.1.1-3";
  src = sources.launch_param_builder;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python rclpy xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Python library for loading parameters in launch files";
  };
}
