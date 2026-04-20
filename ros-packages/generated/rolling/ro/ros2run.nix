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
  version = "0.40.6-1";
  src = finalAttrs.passthru.sources."ros2run";
  propagatedNativeBuildInputs = [ ros2cli ros2pkg ];
  propagatedBuildInputs = [ ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2run" = substituteSource {
      src = fetchgit {
        name = "ros2run-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "5e50096a1509b4ad2dba05d583b6a1622115c985";
        hash = "sha256-9dGIu/zJDVh9dImb/B+a1cKNOsePPXHHADnZMMnhwzc=";
      };
    };
  });
  meta = {
    description = "\n    The run command for ROS 2 command line tools.\n  ";
  };
})
