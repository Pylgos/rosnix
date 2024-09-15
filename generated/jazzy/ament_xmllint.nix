{
  ament_copyright,
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
    ament_xmllint = substituteSource {
      src = fetchgit {
        name = "ament_xmllint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "e9ba8180050ef6c9cc988053dc002c12a649d3f9";
        hash = "sha256-hEPWBk0jFXWmN31PEl3WknzxY1V5ToOead2AJ1xNJUA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_xmllint";
  version = "0.17.1-1";
  src = sources.ament_xmllint;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libxml2-utils" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libxml2-utils" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The ability to check XML files like the package manifest using xmllint and generate xUnit test result files.";
  };
}
