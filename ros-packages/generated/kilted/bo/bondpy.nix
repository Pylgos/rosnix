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
  version = "4.1.2-2";
  src = finalAttrs.passthru.sources."bondpy";
  propagatedNativeBuildInputs = [ bond rclpy smclib ];
  propagatedBuildInputs = [ bond rclpy smclib ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "bondpy" = substituteSource {
      src = fetchgit {
        name = "bondpy-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "2ab7e9b5f0c5ed3c96c1d5b0fcae6cba7c94dc72";
        hash = "sha256-NqSWf/hEZyhanUQRabhPuua4gz1A80/bxE4sk1lbf8k=";
      };
    };
  });
  meta = {
    description = "\n    Python implementation of bond, a mechanism for checking when\n    another process has terminated.\n  ";
  };
})
