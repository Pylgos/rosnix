{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_black = substituteSource {
      src = fetchgit {
        name = "ament_black-source";
        url = "https://github.com/ros2-gbp/ament_black-release.git";
        rev = "10956deec9bbb254277550b44122013a95af8ec1";
        hash = "sha256-75DSVo2ZlTar8EZ2igQzjUMLZR23hgJ/xoBkADbuUog=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_black";
  version = "0.2.5-1";
  src = sources.ament_black;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.black buildPackages.python3Packages.unidiff ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.black python3Packages.unidiff ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint python3Packages.pytest ];
  missingDependencies = [ "python3-uvloop" ];
  meta = {
    description = "The ability to check code against style conventions using black and generate xUnit test result files.";
  };
}
