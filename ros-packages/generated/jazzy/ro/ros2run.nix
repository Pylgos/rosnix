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
  version = "0.32.4-1";
  src = finalAttrs.passthru.sources."ros2run";
  propagatedBuildInputs = [ ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2run" = substituteSource {
      src = fetchgit {
        name = "ros2run-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "4809587cec21fb76ece1a9b85357c1a4ce45e9d1";
        hash = "sha256-YcidRwS555oqQjhu4ZKjgEhzvy3wtyNyfjiW5QxuJPA=";
      };
    };
  });
  meta = {
    description = "The run command for ROS 2 command line tools.";
  };
})
