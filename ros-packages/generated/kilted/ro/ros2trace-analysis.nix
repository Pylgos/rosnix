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
  version = "3.1.0-2";
  src = finalAttrs.passthru.sources."ros2trace_analysis";
  propagatedNativeBuildInputs = [ ros2cli tracetools-analysis ];
  propagatedBuildInputs = [ ros2cli tracetools-analysis ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2trace_analysis" = substituteSource {
      src = fetchgit {
        name = "ros2trace_analysis-source";
        url = "https://github.com/ros2-gbp/tracetools_analysis-release.git";
        rev = "e23c8ff3fa1cab3524bbf3544b06604af1c744db";
        hash = "sha256-AIyVsmKHIC9W80kbsllX5PFXlmNbHmlwMSJ1Z7XeNlU=";
      };
    };
  });
  meta = {
    description = "The trace-analysis command for ROS 2 command line tools.";
  };
})
