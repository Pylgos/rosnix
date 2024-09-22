{
  ament_lint,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_flake8 = substituteSource {
      src = fetchFromGitHub {
        name = "ament_flake8-source";
        owner = "ros2-gbp";
        repo = "ament_lint-release";
        rev = "3810a74bdf9742742999a3cf7c41858535c59641";
        hash = "sha256-+BzTuEDIDPEVwvpwaxXg3hBMvXqYeYdbHR0xfMObWxc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_flake8";
  version = "0.18.1-1";
  src = sources.ament_flake8;
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
