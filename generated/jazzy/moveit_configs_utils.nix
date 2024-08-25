{
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_param_builder,
  launch_ros,
  srdfdom,
  substituteSource,
}:
let
  sources = rec {
    moveit_configs_utils = substituteSource {
      src = fetchgit {
        name = "moveit_configs_utils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5b1a56d796279057a36d9738191655ecf616b024";
        hash = "sha256-8DDHsJCi1DVNRwZcC9PrM6vw7VJA2mZjeOroGm+NewY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_configs_utils";
  version = "2.10.0-1";
  src = sources.moveit_configs_utils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python launch launch_param_builder launch_ros srdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Python library for loading moveit config parameters in launch files";
  };
}
