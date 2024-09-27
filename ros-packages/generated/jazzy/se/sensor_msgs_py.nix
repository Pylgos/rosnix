{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    sensor_msgs_py-6c3323e5153a1c9c6dd9f54bdbbb039fde31873a = substituteSource {
      src = fetchgit {
        name = "sensor_msgs_py-6c3323e5153a1c9c6dd9f54bdbbb039fde31873a-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "6c3323e5153a1c9c6dd9f54bdbbb039fde31873a";
        hash = "sha256-RyIafHfr3e2zSJlKB8OoYweMJErq7q9KrJqK/fGSmLo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sensor_msgs_py";
  version = "5.3.5-1";
  src = sources.sensor_msgs_py-6c3323e5153a1c9c6dd9f54bdbbb039fde31873a;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "A package for easy creation and reading of PointCloud2 messages in Python.";
  };
}
