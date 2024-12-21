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
  version = "0.36.1-1";
  src = finalAttrs.passthru.sources."ros2run";
  propagatedBuildInputs = [ ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2run" = substituteSource {
      src = fetchgit {
        name = "ros2run-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "077839cbd02ce41a0136e3b67a3b7d26b8463c03";
        hash = "sha256-CmS3ncO3MJu0jpZKwJS/r2MFNtdKwU0JagjiQUSbX/A=";
      };
    };
  });
  meta = {
    description = "The run command for ROS 2 command line tools.";
  };
})
