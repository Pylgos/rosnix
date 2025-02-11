{
  action-msgs,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav2-msgs,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "nav2_simple_commander";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav2_simple_commander";
  propagatedBuildInputs = [ action-msgs geometry-msgs lifecycle-msgs nav2-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nav2_simple_commander" = substituteSource {
      src = fetchgit {
        name = "nav2_simple_commander-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "87deb482542e9dcab79d056cfde11d14179b372f";
        hash = "sha256-UmUeBxbk9JDVpOmwC7TfExi55DyLhz58ONzHYpJzcjw=";
      };
    };
  });
  meta = {
    description = "An importable library for writing mobile robot applications in python3";
  };
})
