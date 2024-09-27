{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rosidl_cli-f3fbc3dcadb5ca306407c31fbaa0ecba83986182 = substituteSource {
      src = fetchgit {
        name = "rosidl_cli-f3fbc3dcadb5ca306407c31fbaa0ecba83986182-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "f3fbc3dcadb5ca306407c31fbaa0ecba83986182";
        hash = "sha256-a0EE0q4GAoNQ7F0z3KQISmIiLZmDH99iv1fTzIfIwCA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_cli";
  version = "4.6.4-1";
  src = sources.rosidl_cli-f3fbc3dcadb5ca306407c31fbaa0ecba83986182;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" "python3-importlib-metadata" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-argcomplete" "python3-importlib-metadata" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Command line tools for ROS interface generation.";
  };
}
