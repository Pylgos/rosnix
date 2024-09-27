{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ruckig-6e6056ac1b4b292b397710b0c242512eaac92bd4 = substituteSource {
      src = fetchgit {
        name = "ruckig-6e6056ac1b4b292b397710b0c242512eaac92bd4-source";
        url = "https://github.com/ros2-gbp/ruckig-release.git";
        rev = "6e6056ac1b4b292b397710b0c242512eaac92bd4";
        hash = "sha256-xzv0PejVB2frTXtd7fnF72E49MOQaARx6boGHYzyVnQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ruckig";
  version = "0.9.2-5";
  src = sources.ruckig-6e6056ac1b4b292b397710b0c242512eaac92bd4;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Instantaneous Motion Generation for Robots and Machines.";
  };
}
