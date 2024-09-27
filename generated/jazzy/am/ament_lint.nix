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
    ament_lint-743e72f2a5a406d647dceeeaec8e201cceebe378 = substituteSource {
      src = fetchgit {
        name = "ament_lint-743e72f2a5a406d647dceeeaec8e201cceebe378-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "743e72f2a5a406d647dceeeaec8e201cceebe378";
        hash = "sha256-dEz6J1YJhhpuCG2qc+Su536EpeXGuwXmQ4E86mfZfzE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_lint";
  version = "0.17.1-1";
  src = sources.ament_lint-743e72f2a5a406d647dceeeaec8e201cceebe378;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Providing common API for ament linter packages.";
  };
}
