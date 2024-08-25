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
    launch_xml = substituteSource {
      src = fetchgit {
        name = "launch_xml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
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
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "XML frontend for the launch package.";
  };
}
