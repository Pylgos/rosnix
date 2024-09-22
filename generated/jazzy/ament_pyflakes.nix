{
  ament_pycodestyle,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_pyflakes = substituteSource {
      src = fetchgit {
        name = "ament_pyflakes-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "1862376009b02b5088acb8ac300da55e65394d8a";
        hash = "sha256-KMHU5aqi9tt95GgtqbB7obYtSAUxzWzR/UFQhILKkdk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pyflakes";
  version = "0.17.1-1";
  src = sources.ament_pyflakes;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pyflakes3" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pyflakes3" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_pycodestyle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The ability to check code using pyflakes and generate xUnit test result files.";
  };
}
