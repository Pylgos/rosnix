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
  pname = "ament_cpplint";
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_cpplint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cpplint" = substituteSource {
        src = fetchgit {
          name = "ament_cpplint-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "6c99507f0659ac3dfa55181109e7e4a0d2f0a769";
          hash = "sha256-fSMloe4C8xijCEGPbkSmIFBhYOO+JQkYUQl7N1M38CU=";
        };
      };
    });
  };
  meta = {
    description = "The ability to check code against the Google style conventions using cpplint and generate xUnit test result files.";
  };
})
