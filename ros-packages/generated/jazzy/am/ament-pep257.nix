{
  ament-flake8,
  ament-lint,
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
    "ament_pep257" = substituteSource {
      src = fetchgit {
        name = "ament_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "0bb71d571b221aeb287068c94187568fd9056cda";
        hash = "sha256-AeV5aRu0D5pK6O5Ywq4FIEho2kkeDb++umzFTgOkrAQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_pep257";
  version = "0.17.1-1";
  src = sources."ament_pep257";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pydocstyle" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pydocstyle" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The ability to check code against the docstring style conventions in PEP 257 and generate xUnit test result files.";
  };
}
