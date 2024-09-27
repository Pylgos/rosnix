{
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_param_builder,
  launch_ros,
  rosSystemPackages,
  srdfdom,
  substituteSource,
}:
let
  sources = rec {
    moveit_configs_utils-5b1a56d796279057a36d9738191655ecf616b024 = substituteSource {
      src = fetchgit {
        name = "moveit_configs_utils-5b1a56d796279057a36d9738191655ecf616b024-source";
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
  src = sources.moveit_configs_utils-5b1a56d796279057a36d9738191655ecf616b024;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python launch launch_param_builder launch_ros srdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Python library for loading moveit config parameters in launch files";
  };
}
