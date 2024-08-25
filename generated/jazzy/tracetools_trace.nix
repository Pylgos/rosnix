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
        rev = "0b4fed251fb0f36011894f0c1579760c0c06aac4";
        hash = "sha256-ch4DMQjovwGHhTAxm3HVXqAW1kxHWbFkce6vxiSEEHw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_trace";
  version = "8.2.1-1";
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
