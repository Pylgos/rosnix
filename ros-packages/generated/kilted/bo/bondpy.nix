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
  version = "4.3.0-1";
  src = finalAttrs.passthru.sources."bondpy";
  propagatedNativeBuildInputs = [ bond rclpy smclib ];
  propagatedBuildInputs = [ bond rclpy smclib ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "bondpy" = substituteSource {
      src = fetchgit {
        name = "bondpy-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "f27a4f10f3e85f1bfc5869e30e3732d6e4c4c158";
        hash = "sha256-hBbYc5fOJt9DY0APg8zVEHxxCadKus9YMsVcJ4jKkzs=";
      };
    };
  });
  meta = {
    description = "\n    Python implementation of bond, a mechanism for checking when\n    another process has terminated.\n  ";
  };
})
