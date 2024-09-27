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
    ament_cpplint-11877123f5f285c0dbdd8a5aa4ae6bea6d238cf6 = substituteSource {
      src = fetchgit {
        name = "ament_cpplint-11877123f5f285c0dbdd8a5aa4ae6bea6d238cf6-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "11877123f5f285c0dbdd8a5aa4ae6bea6d238cf6";
        hash = "sha256-13KjfdbDXUhNFxtNJI4LCKRBjlVB1sw/ZlnAOK4FJ9c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cpplint";
  version = "0.17.1-1";
  src = sources.ament_cpplint-11877123f5f285c0dbdd8a5aa4ae6bea6d238cf6;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The ability to check code against the Google style conventions using cpplint and generate xUnit test result files.";
  };
}
