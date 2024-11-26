{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  bond,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  smclib,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "bondpy";
  version = "4.1.0-1";
  src = finalAttrs.passthru.sources."bondpy";
  propagatedBuildInputs = [ bond rclpy smclib ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "bondpy" = substituteSource {
        src = fetchgit {
          name = "bondpy-source";
          url = "https://github.com/ros2-gbp/bond_core-release.git";
          rev = "8cbc01c7083721aaf19d618eb095bb247d0f3467";
          hash = "sha256-qBFpCzvtA7/Vghb+QkbCL8TBZoc5Kdhp+q876UZqVhM=";
        };
      };
    });
  };
  meta = {
    description = "Python implementation of bond, a mechanism for checking when another process has terminated.";
  };
})
