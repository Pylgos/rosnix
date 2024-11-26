{
  ament-copyright,
  ament-flake8,
  ament-mypy,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2cli,
  rosSystemPackages,
  substituteSource,
  tracetools-analysis,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2trace_analysis";
  version = "3.0.0-6";
  src = finalAttrs.passthru.sources."ros2trace_analysis";
  propagatedBuildInputs = [ ros2cli tracetools-analysis ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2trace_analysis" = substituteSource {
      src = fetchgit {
        name = "ros2trace_analysis-source";
        url = "https://github.com/ros2-gbp/tracetools_analysis-release.git";
        rev = "23e4677fbc691efadbad1a8a231fab60e2d794a5";
        hash = "sha256-88nEQ39lxqn4A5k9lH63DZqI0nV7umn2QUpbOCQyVpE=";
      };
    };
  });
  meta = {
    description = "The trace-analysis command for ROS 2 command line tools.";
  };
})
