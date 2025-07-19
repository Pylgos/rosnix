{
  ament-copyright,
  ament-flake8,
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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2multicast";
  version = "0.38.0-1";
  src = finalAttrs.passthru.sources."ros2multicast";
  propagatedNativeBuildInputs = [ ros2cli ];
  propagatedBuildInputs = [ ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2multicast" = substituteSource {
      src = fetchgit {
        name = "ros2multicast-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "460cd992d9e0e4800b64b8ed7030b1f2c9efc1a2";
        hash = "sha256-Eda/GAL332NHQcgyO8GTF9P5mZU7lrIfzddalXkSj/A=";
      };
    };
  });
  meta = {
    description = "\n    The multicast command for ROS 2 command line tools.\n  ";
  };
})
