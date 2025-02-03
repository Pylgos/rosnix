{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-pycodestyle,
  ament-xmllint,
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
  version = "0.19.1-1";
  src = finalAttrs.passthru.sources."ament_cppcheck";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cppcheck" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cppcheck" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-pycodestyle ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cppcheck" = substituteSource {
      src = fetchgit {
        name = "ament_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "773b5fd9ae8bba277678f7c240a35804cfbd968e";
        hash = "sha256-q7aOBEfJ8ftQTTYpovVCazbrVXkhEZQpFsrxQ7h26uo=";
      };
    };
  });
  meta = {
    description = "The ability to perform static code analysis on C/C++ code using Cppcheck and generate xUnit test result files.";
  };
})
