{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ruckig" = substituteSource {
      src = fetchgit {
        name = "ruckig-source";
        url = "https://github.com/ros2-gbp/ruckig-release.git";
        rev = "32c387d879a88ffaf2a9ea5510a9f1eeabe47ab5";
        hash = "sha256-xzv0PejVB2frTXtd7fnF72E49MOQaARx6boGHYzyVnQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ruckig";
  version = "0.9.2-4";
  src = sources."ruckig";
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