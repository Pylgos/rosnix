{
  ament-flake8,
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
  version = "0.17.4-1";
  src = finalAttrs.passthru.sources."ament_mypy";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-mypy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-mypy" ]; };
  checkInputs = [ ament-flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_mypy" = substituteSource {
      src = fetchgit {
        name = "ament_mypy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "12ff73324d721b018c97423bfe8e581e112154eb";
        hash = "sha256-P3WYa8+uaDHUCW/Sh7Tuf4X1YxrWUXFgaYpQOXKqVVk=";
      };
    };
  });
  meta = {
    description = "Support for mypy static type checking in ament.";
  };
})
