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
  version = "4.1.3-1";
  src = finalAttrs.passthru.sources."bondpy";
  propagatedNativeBuildInputs = [ bond rclpy smclib ];
  propagatedBuildInputs = [ bond rclpy smclib ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "bondpy" = substituteSource {
      src = fetchgit {
        name = "bondpy-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "d634fce3db852b25ed7b2f8e86501cc8c1f8e24e";
        hash = "sha256-szDe5DKpJq0/d62zloXRqYOYFHDqJGtQZgPgZhTLPKE=";
      };
    };
  });
  meta = {
    description = "\n    Python implementation of bond, a mechanism for checking when\n    another process has terminated.\n  ";
  };
})
