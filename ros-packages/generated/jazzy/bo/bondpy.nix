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
  version = "4.2.0-1";
  src = finalAttrs.passthru.sources."bondpy";
  propagatedNativeBuildInputs = [ bond rclpy smclib ];
  propagatedBuildInputs = [ bond rclpy smclib ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "bondpy" = substituteSource {
      src = fetchgit {
        name = "bondpy-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "d43dd7f18274e0d375c2aa70beebbdd2a609e747";
        hash = "sha256-Wd63HfpBZZl2wcmtna7XZXranKMjRAAm/FYLHRChOcs=";
      };
    };
  });
  meta = {
    description = "\n    Python implementation of bond, a mechanism for checking when\n    another process has terminated.\n  ";
  };
})
