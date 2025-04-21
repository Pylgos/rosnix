{
  ament-flake8,
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
  pname = "ament_mypy";
  version = "0.19.2-1";
  src = finalAttrs.passthru.sources."ament_mypy";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-mypy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-mypy" ]; };
  checkInputs = [ ament-flake8 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_mypy" = substituteSource {
      src = fetchgit {
        name = "ament_mypy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "1abc2a6e51d9085bcfdc209dbd6eb001d8502be9";
        hash = "sha256-j6LWebXhWM6t3nw+Z+MN8W5xn+DC0GYGLVDRrCDm07M=";
      };
    };
  });
  meta = {
    description = "Support for mypy static type checking in ament.";
  };
})
