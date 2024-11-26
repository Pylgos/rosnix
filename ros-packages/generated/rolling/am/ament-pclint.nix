{
  ament-copyright,
  ament-flake8,
  ament-pep257,
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
  pname = "ament_pclint";
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_pclint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_pclint" = substituteSource {
        src = fetchgit {
          name = "ament_pclint-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "4af61091551c03eff04c02e840612a3e4a9bf405";
          hash = "sha256-NtIaG/dfFbzoME9PpywwAPclESh9sWBY/voz6aT1URs=";
        };
      };
    });
  };
  meta = {
    description = "The ability to perform static code analysis on C/C++ code using PC-lint and generate xUnit test result files.";
  };
})
