{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    launch_xml = substituteSource {
      src = fetchFromGitHub {
        name = "launch_xml-source";
        owner = "ros2-gbp";
        repo = "launch-release";
        rev = "ccc5b34761bd63ccf6e03cbb307c8dccc3599bd9";
        hash = "sha256-OFO1bIsupAeqetClYN36Uh85dLfdJNZp3GAOQBEQ7Ow=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_xml";
  version = "3.6.1-1";
  src = sources.launch_xml;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "XML frontend for the launch package.";
  };
}
