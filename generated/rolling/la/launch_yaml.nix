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
    launch_yaml-2bca4450b871e955e9a692519af8281320ebb548 = substituteSource {
      src = fetchgit {
        name = "launch_yaml-2bca4450b871e955e9a692519af8281320ebb548-source";
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
  src = sources.launch_yaml-2bca4450b871e955e9a692519af8281320ebb548;
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
