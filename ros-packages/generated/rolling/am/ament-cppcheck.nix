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
  version = "0.20.2-1";
  src = finalAttrs.passthru.sources."ament_cppcheck";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cppcheck" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cppcheck" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-pycodestyle ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cppcheck" = substituteSource {
      src = fetchgit {
        name = "ament_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "8dd5f306abcf3338037e61c8e8101e04acd34bbb";
        hash = "sha256-BGEnkDiUEzebHDaXxo5IbR3wGB//5TMkXHd83g3sD9E=";
      };
    };
  });
  meta = {
    description = "\n    The ability to perform static code analysis on C/C++ code using Cppcheck\n    and generate xUnit test result files.\n  ";
  };
})
