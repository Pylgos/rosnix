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
  version = "0.32.7-1";
  src = finalAttrs.passthru.sources."ros2run";
  propagatedNativeBuildInputs = [ ros2cli ros2pkg ];
  propagatedBuildInputs = [ ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2run" = substituteSource {
      src = fetchgit {
        name = "ros2run-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "2244ac2a1275cff5d62f1fdf3ede5c4617c2139e";
        hash = "sha256-GbECmGaOC1m8pnhAHLUmwpwycPIRkcYRdG2vrKbPMWI=";
      };
    };
  });
  meta = {
    description = "\n    The run command for ROS 2 command line tools.\n  ";
  };
})
