{
  ament_flake8,
  ament_lint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_pep257-35c4d5f9407a68a8c593b009cde3f218e1c10962 = substituteSource {
      src = fetchgit {
        name = "ament_pep257-35c4d5f9407a68a8c593b009cde3f218e1c10962-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "35c4d5f9407a68a8c593b009cde3f218e1c10962";
        hash = "sha256-chTxLQN/tfn3U6fW5183NTPBn+ftAZzDyDQuGj1tvQs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pep257";
  version = "0.18.1-1";
  src = sources.ament_pep257-35c4d5f9407a68a8c593b009cde3f218e1c10962;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pydocstyle" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pydocstyle" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The ability to check code against the docstring style conventions in PEP 257 and generate xUnit test result files.";
  };
}
