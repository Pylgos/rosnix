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
  version = "8.6.0-2";
  src = finalAttrs.passthru.sources."ros2trace";
  propagatedNativeBuildInputs = [ ros2cli tracetools-trace ];
  propagatedBuildInputs = [ ros2cli tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2trace" = substituteSource {
      src = fetchgit {
        name = "ros2trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "ac1dc00d57e105324acef32f7e61157b00a46afd";
        hash = "sha256-vdvZOY1sumNuWNgx4FdM0YF0OMbEsSCyevfy2sZ8Fyw=";
      };
    };
  });
  meta = {
    description = "The trace command for ROS 2 command line tools.";
  };
})
