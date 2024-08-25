{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    launch_yaml = substituteSource {
      src = fetchgit {
        name = "launch_yaml-source";
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
  src = sources.launch_yaml;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "YAML frontend for the launch package.";
  };
}
