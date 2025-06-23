{
  ament-flake8,
  ament-lint,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_copyright";
  version = "0.20.1-1";
  src = finalAttrs.passthru.sources."ament_copyright";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" ]; };
  checkInputs = [ ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_copyright" = substituteSource {
      src = fetchgit {
        name = "ament_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "b3678c93d1838d725404ebce0faeb746e3ed82ca";
        hash = "sha256-Y4Jh7f4gKqUcG1B8GZcqqHkZOOaGfEjH974yyQetTj4=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check source files for copyright and license\n    information.\n  ";
  };
})
