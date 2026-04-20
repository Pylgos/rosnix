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
  version = "4.4.0-1";
  src = finalAttrs.passthru.sources."bondpy";
  propagatedNativeBuildInputs = [ bond rclpy smclib ];
  propagatedBuildInputs = [ bond rclpy smclib ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "bondpy" = substituteSource {
      src = fetchgit {
        name = "bondpy-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "c2c1d18d88422e4223b6d9793aeebc1639a77c4a";
        hash = "sha256-AWBIb78N8F+vlIv155dOMtHmxd3tf4s9hCsBvbFAjew=";
      };
    };
  });
  meta = {
    description = "\n    Python implementation of bond, a mechanism for checking when\n    another process has terminated.\n  ";
  };
})
