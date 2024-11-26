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
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_mypy";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-mypy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-mypy" ]; };
  checkInputs = [ ament-flake8 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_mypy" = substituteSource {
        src = fetchgit {
          name = "ament_mypy-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "6fc997eba599748ca91d9ea92ca5a644e558b770";
          hash = "sha256-ULlxsGOKxCTgi+60FJe7/SqRmkYohMbZQSU+Vk9JF08=";
        };
      };
    });
  };
  meta = {
    description = "Support for mypy static type checking in ament.";
  };
})
