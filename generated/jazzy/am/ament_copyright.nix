{
  ament_flake8,
  ament_lint,
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
    ament_copyright-f654101da3cf1def189f0c17a520ae92f28798bd = substituteSource {
      src = fetchgit {
        name = "ament_copyright-f654101da3cf1def189f0c17a520ae92f28798bd-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "f654101da3cf1def189f0c17a520ae92f28798bd";
        hash = "sha256-LVeMfca8EQ5mvYuUo13PqnkllrAvlbUo0VOev/twp4k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_copyright";
  version = "0.17.1-1";
  src = sources.ament_copyright-f654101da3cf1def189f0c17a520ae92f28798bd;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The ability to check source files for copyright and license information.";
  };
}
