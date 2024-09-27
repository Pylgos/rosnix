{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    picknik_ament_copyright-6b7823c44e2f1588d32fcaa65af0d53d9084efbb = substituteSource {
      src = fetchgit {
        name = "picknik_ament_copyright-6b7823c44e2f1588d32fcaa65af0d53d9084efbb-source";
        url = "https://github.com/ros2-gbp/picknik_ament_copyright-release.git";
        rev = "6b7823c44e2f1588d32fcaa65af0d53d9084efbb";
        hash = "sha256-zw0URrOQbcL7fo+BgOUHgI0yqf0DDRVGnOOxbJmog48=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "picknik_ament_copyright";
  version = "0.0.2-4";
  src = sources.picknik_ament_copyright-6b7823c44e2f1588d32fcaa65af0d53d9084efbb;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_copyright ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Check PickNik-specific copyright headers.";
  };
}
