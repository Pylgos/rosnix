{
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
    ament_flake8-14de142529f6aec081b365637f2683109321440d = substituteSource {
      src = fetchgit {
        name = "ament_flake8-14de142529f6aec081b365637f2683109321440d-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "14de142529f6aec081b365637f2683109321440d";
        hash = "sha256-0sUE60ee36OXnMpBjLcxwpNlozQqWJUTo5BI9/c2Wfo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_flake8";
  version = "0.17.1-1";
  src = sources.ament_flake8-14de142529f6aec081b365637f2683109321440d;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-flake8" "python3-flake8-builtins" "python3-flake8-comprehensions" "python3-flake8-docstrings" "python3-flake8-import-order" "python3-flake8-quotes" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-flake8" "python3-flake8-builtins" "python3-flake8-comprehensions" "python3-flake8-docstrings" "python3-flake8-import-order" "python3-flake8-quotes" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to check code for style and syntax conventions with flake8.";
  };
}
