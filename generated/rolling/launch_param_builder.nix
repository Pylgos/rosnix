{
  ament_copyright,
  ament_index_python,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
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
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python rclpy xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Python library for loading parameters in launch files";
  };
}
