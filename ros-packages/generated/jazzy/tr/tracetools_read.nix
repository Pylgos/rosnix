{
  ament_copyright,
  ament_flake8,
  ament_mypy,
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
    tracetools_read-48cb7678e728dc7598fb59557128ca80d06753c3 = substituteSource {
      src = fetchgit {
        name = "tracetools_read-48cb7678e728dc7598fb59557128ca80d06753c3-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "48cb7678e728dc7598fb59557128ca80d06753c3";
        hash = "sha256-ukhc281p7QYYiNjLhf5alREqxspi0wu04fc92FLwz1A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_read";
  version = "8.2.2-1";
  src = sources.tracetools_read-48cb7678e728dc7598fb59557128ca80d06753c3;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-babeltrace" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Tools for reading traces.";
  };
}
