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
    launch_xml-ccc5b34761bd63ccf6e03cbb307c8dccc3599bd9 = substituteSource {
      src = fetchgit {
        name = "launch_xml-ccc5b34761bd63ccf6e03cbb307c8dccc3599bd9-source";
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
  src = sources.launch_xml-ccc5b34761bd63ccf6e03cbb307c8dccc3599bd9;
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
