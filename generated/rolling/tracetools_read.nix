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
