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
  tracetools-trace,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2trace";
  version = "8.4.1-1";
  src = finalAttrs.passthru.sources."ros2trace";
  propagatedBuildInputs = [ ros2cli tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2trace" = substituteSource {
        src = fetchgit {
          name = "ros2trace-source";
          url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
          rev = "b26f1db364c188d18970dfe9fd239685eba9ad65";
          hash = "sha256-KTHcP15Wfli48lnqRLeCMCKd49Kt0DBG6j6mhnhy/ag=";
        };
      };
    });
  };
  meta = {
    description = "The trace command for ROS 2 command line tools.";
  };
})
