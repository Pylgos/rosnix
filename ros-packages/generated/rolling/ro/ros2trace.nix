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
  version = "8.10.1-2";
  src = finalAttrs.passthru.sources."ros2trace";
  propagatedNativeBuildInputs = [ ros2cli tracetools-trace ];
  propagatedBuildInputs = [ ros2cli tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2trace" = substituteSource {
      src = fetchgit {
        name = "ros2trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "5585d63f7bebd7ac52108cc15d39292b0cfb61cd";
        hash = "sha256-ix805XlNpmL2y7SgN7MPWKGHqEakx4CMCBgvcugGVbA=";
      };
    };
  });
  meta = {
    description = "The trace command for ROS 2 command line tools.";
  };
})
