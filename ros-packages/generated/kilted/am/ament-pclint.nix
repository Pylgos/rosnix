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
  version = "0.19.3-2";
  src = finalAttrs.passthru.sources."ament_pclint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pclint" = substituteSource {
      src = fetchgit {
        name = "ament_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "84c730fac157332650cf162d0bb33086ddc78f8a";
        hash = "sha256-FiMq3ttR+/YWJrplVvhWB2+dTL46fbsAZnwQ5k+58SY=";
      };
    };
  });
  meta = {
    description = "\n    The ability to perform static code analysis on C/C++ code using PC-lint\n    and generate xUnit test result files.\n  ";
  };
})
