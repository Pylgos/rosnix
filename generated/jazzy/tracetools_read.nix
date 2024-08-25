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
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    tracetools_read = substituteSource {
      src = fetchgit {
        name = "tracetools_read-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "d2400eeb280651f83520b2bc51ff80ab431cee28";
        hash = "sha256-NPKfGkVG8PaQ12F2IkOJV4Yxi7k5y226Coc7i9HaCQE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_read";
  version = "8.2.1-1";
  src = sources.tracetools_read;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ament_xmllint python3Packages.pytest ];
  missingDependencies = [ "python3-babeltrace" ];
  meta = {
    description = "Tools for reading traces.";
  };
}
