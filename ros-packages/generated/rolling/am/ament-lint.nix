{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_lint";
  version = "0.19.1-1";
  src = finalAttrs.passthru.sources."ament_lint";
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_lint" = substituteSource {
      src = fetchgit {
        name = "ament_lint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "145da6ac534d8106af21faa1a0acd696d02ab67f";
        hash = "sha256-2hPVQF66MdOpFJQ26YQ9/Tty5ZojUoLyhG9kY9UAcqk=";
      };
    };
  });
  meta = {
    description = "Providing common API for ament linter packages.";
  };
})
