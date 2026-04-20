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
  version = "0.19.3-2";
  src = finalAttrs.passthru.sources."ament_mypy";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-mypy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-mypy" ]; };
  checkInputs = [ ament-flake8 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_mypy" = substituteSource {
      src = fetchgit {
        name = "ament_mypy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "bfe07758ebb08aa171a15613fb5128b1237d6360";
        hash = "sha256-+LWZz8Iptw/Us1WYWAn1JtcZS+Bu759ycklr+2wRp3g=";
      };
    };
  });
  meta = {
    description = "Support for mypy static type checking in ament.";
  };
})
