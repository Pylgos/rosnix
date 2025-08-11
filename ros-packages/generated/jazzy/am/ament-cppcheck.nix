{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-pycodestyle,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_cppcheck";
  version = "0.17.3-1";
  src = finalAttrs.passthru.sources."ament_cppcheck";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cppcheck" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cppcheck" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-pycodestyle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cppcheck" = substituteSource {
      src = fetchgit {
        name = "ament_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "be98a5ab212b1d59f18068912cd3c61af7ed077a";
        hash = "sha256-awyCieYQXMWxu5DHC/7RlRpr5jUMwJgUJ9rEitNVD+E=";
      };
    };
  });
  meta = {
    description = "\n    The ability to perform static code analysis on C/C++ code using Cppcheck\n    and generate xUnit test result files.\n  ";
  };
})
