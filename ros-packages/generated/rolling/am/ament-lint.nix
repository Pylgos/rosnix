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
  version = "0.20.0-1";
  src = finalAttrs.passthru.sources."ament_lint";
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_lint" = substituteSource {
      src = fetchgit {
        name = "ament_lint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "ca4c2fa50d3fcaaaf9356c96d0e3c3e36e3602b6";
        hash = "sha256-fqZhmFSlJrQQDl4GyK7jW3jqP22JSKfLjKVVrureVlk=";
      };
    };
  });
  meta = {
    description = "Providing common API for ament linter packages.";
  };
})
