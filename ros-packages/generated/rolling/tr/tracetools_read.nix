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
    tracetools_read-78857c1ded61f0015973fb6a3ad52a9d1c1636e8 = substituteSource {
      src = fetchgit {
        name = "tracetools_read-78857c1ded61f0015973fb6a3ad52a9d1c1636e8-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "78857c1ded61f0015973fb6a3ad52a9d1c1636e8";
        hash = "sha256-zVtwFF9gsp/Z2pDhY6isWui/zuCaIObeexGw/SlDC68=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_read";
  version = "8.3.0-1";
  src = sources.tracetools_read-78857c1ded61f0015973fb6a3ad52a9d1c1636e8;
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
