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
  ros2pkg,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2run";
  version = "0.36.0-1";
  src = finalAttrs.passthru.sources."ros2run";
  propagatedBuildInputs = [ ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2run" = substituteSource {
        src = fetchgit {
          name = "ros2run-source";
          url = "https://github.com/ros2-gbp/ros2cli-release.git";
          rev = "fcc1f50429fd750d368a30e7fcae7d615f28df57";
          hash = "sha256-tO1w4T0oMWjqff8GpeJ3Nh2IO8tZFJ2/jy+HniSVBeU=";
        };
      };
    });
  };
  meta = {
    description = "The run command for ROS 2 command line tools.";
  };
})
