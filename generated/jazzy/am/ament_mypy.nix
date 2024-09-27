{
  ament_flake8,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_mypy-ee3cc105753726632d19cc5772a9ad3ca859010b = substituteSource {
      src = fetchgit {
        name = "ament_mypy-ee3cc105753726632d19cc5772a9ad3ca859010b-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "ee3cc105753726632d19cc5772a9ad3ca859010b";
        hash = "sha256-hM3pes968NZW++cG6X/0jH3kUejkInacRxaXCI3p994=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_mypy";
  version = "0.17.1-1";
  src = sources.ament_mypy-ee3cc105753726632d19cc5772a9ad3ca859010b;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-mypy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-mypy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  meta = {
    description = "Support for mypy static type checking in ament.";
  };
}
