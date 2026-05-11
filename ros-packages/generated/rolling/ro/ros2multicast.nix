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
  version = "0.41.0-1";
  src = finalAttrs.passthru.sources."ros2multicast";
  propagatedNativeBuildInputs = [ ros2cli ];
  propagatedBuildInputs = [ ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2multicast" = substituteSource {
      src = fetchgit {
        name = "ros2multicast-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "97d1f934e3c1cebc10e948d8ce0a86709be226f1";
        hash = "sha256-LHSTUj4hTeGXySDqoAGGpXFMLoVvx9xJ+7UB4Ax2uAk=";
      };
    };
  });
  meta = {
    description = "\n    The multicast command for ROS 2 command line tools.\n  ";
  };
})
