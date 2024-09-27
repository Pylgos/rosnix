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
  launch,
  launch_ros,
  rosSystemPackages,
  substituteSource,
  tracetools_launch,
  tracetools_read,
  tracetools_trace,
}:
let
  sources = rec {
    tracetools_test-6fb2389546fe86bfaa694e6afcbce145daf4d077 = substituteSource {
      src = fetchgit {
        name = "tracetools_test-6fb2389546fe86bfaa694e6afcbce145daf4d077-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "6fb2389546fe86bfaa694e6afcbce145daf4d077";
        hash = "sha256-qf0i8ZHVhXe0qGM4G7TZ8hqrou6iKvFN/AMFYG12ux8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_test";
  version = "8.2.2-1";
  src = sources.tracetools_test-6fb2389546fe86bfaa694e6afcbce145daf4d077;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch launch_ros tracetools_launch tracetools_read tracetools_trace ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Utilities for tracing-related tests.";
  };
}
