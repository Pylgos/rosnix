{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    launch_yaml-9ec1892e132a4c5eafda96bbdd987781d98551e6 = substituteSource {
      src = fetchgit {
        name = "launch_yaml-9ec1892e132a4c5eafda96bbdd987781d98551e6-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "9ec1892e132a4c5eafda96bbdd987781d98551e6";
        hash = "sha256-iTmdj7Xmv7WasHOQRLTCptwQoYDOht8pT+KWtklLPxI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_yaml";
  version = "3.4.2-2";
  src = sources.launch_yaml-9ec1892e132a4c5eafda96bbdd987781d98551e6;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "YAML frontend for the launch package.";
  };
}
