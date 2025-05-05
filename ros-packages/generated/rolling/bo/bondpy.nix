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
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ bond smclib ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "bondpy" = substituteSource {
      src = fetchgit {
        name = "bondpy-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "0122d0085c2cc9b682bb0e0879d581052208985e";
        hash = "sha256-NqSWf/hEZyhanUQRabhPuua4gz1A80/bxE4sk1lbf8k=";
      };
    };
  });
  meta = {
    description = "Python implementation of bond, a mechanism for checking when another process has terminated.";
  };
})
