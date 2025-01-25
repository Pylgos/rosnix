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
  version = "4.1.2-1";
  src = finalAttrs.passthru.sources."bondpy";
  propagatedBuildInputs = [ bond rclpy smclib ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "bondpy" = substituteSource {
      src = fetchgit {
        name = "bondpy-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "8fed6d35d1624608496eb10cbb00b6576b4be47b";
        hash = "sha256-NqSWf/hEZyhanUQRabhPuua4gz1A80/bxE4sk1lbf8k=";
      };
    };
  });
  meta = {
    description = "Python implementation of bond, a mechanism for checking when another process has terminated.";
  };
})
