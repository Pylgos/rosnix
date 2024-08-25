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
        rev = "d38b5e1dff58ba58a94a822846318b0840786023";
        hash = "sha256-Qqc/i5ghzglsx794HAP6CBwuymTldnwQzcBT/psyhw0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_xml";
  version = "3.4.2-2";
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
