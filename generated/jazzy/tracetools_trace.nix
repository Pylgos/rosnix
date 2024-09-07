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
  lttngpy,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    tracetools_trace = substituteSource {
      src = fetchgit {
        name = "tracetools_trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "89c3d3d5186f550d827edaadfc2be33eb0a04d07";
        hash = "sha256-gj1/GpN/5f+6kwdGvmKGBqmzIBHSME+hUPhI8VLqn3c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_trace";
  version = "8.2.2-1";
  src = sources.tracetools_trace;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lttngpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Tools for setting up tracing sessions.";
  };
}
