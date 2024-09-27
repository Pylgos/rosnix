{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rpyutils-6695a538e5cba92c66847abb6574eec63aa18c8b = substituteSource {
      src = fetchgit {
        name = "rpyutils-6695a538e5cba92c66847abb6574eec63aa18c8b-source";
        url = "https://github.com/ros2-gbp/rpyutils-release.git";
        rev = "6695a538e5cba92c66847abb6574eec63aa18c8b";
        hash = "sha256-t72zIwVtVJX3ZymNZ2iOhOwgSN/sycNcRLBiEDjmEag=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rpyutils";
  version = "0.5.0-1";
  src = sources.rpyutils-6695a538e5cba92c66847abb6574eec63aa18c8b;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Package containing various utility types and functions for Python";
  };
}
