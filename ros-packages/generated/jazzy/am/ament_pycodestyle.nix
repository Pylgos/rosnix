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
    ament_pycodestyle-6bef8f6c1ad417071b10bf2c6204134822cc74dc = substituteSource {
      src = fetchgit {
        name = "ament_pycodestyle-6bef8f6c1ad417071b10bf2c6204134822cc74dc-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "6bef8f6c1ad417071b10bf2c6204134822cc74dc";
        hash = "sha256-zY+5b5O+jZjQSE7zTWrWth8dDUlmpeCRiCBSCFR1Xbg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pycodestyle";
  version = "0.17.1-1";
  src = sources.ament_pycodestyle-6bef8f6c1ad417071b10bf2c6204134822cc74dc;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pycodestyle" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pycodestyle" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to check code against the style conventions in PEP 8 and generate xUnit test result files.";
  };
}
