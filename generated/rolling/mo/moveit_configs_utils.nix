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
    moveit_configs_utils-54434ddd394a6e34f41041e0eec4d8ca590e1cf3 = substituteSource {
      src = fetchgit {
        name = "moveit_configs_utils-54434ddd394a6e34f41041e0eec4d8ca590e1cf3-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "54434ddd394a6e34f41041e0eec4d8ca590e1cf3";
        hash = "sha256-w02c4XLWlpC5t4RdhfIgbKqP6cEwdCwxstnv5uNWxqA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_configs_utils";
  version = "2.11.0-1";
  src = sources.moveit_configs_utils-54434ddd394a6e34f41041e0eec4d8ca590e1cf3;
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
