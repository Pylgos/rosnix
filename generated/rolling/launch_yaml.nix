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
        rev = "2bca4450b871e955e9a692519af8281320ebb548";
        hash = "sha256-bw39CkBRpeDxjd8HCQ2s9IW90WEY1yLP7bOb8MkByOk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_yaml";
  version = "3.6.1-1";
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
