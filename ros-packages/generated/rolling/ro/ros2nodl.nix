{
  ament-flake8,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  ament-mypy,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nodl-python,
  ros2cli,
  ros2pkg,
  ros2run,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2nodl";
  version = "0.3.1-5";
  src = finalAttrs.passthru.sources."ros2nodl";
  propagatedNativeBuildInputs = [ ament-index-python nodl-python ros2cli ros2pkg ros2run ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" ]; };
  propagatedBuildInputs = [ ament-index-python nodl-python ros2cli ros2pkg ros2run ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-argcomplete" ]; };
  checkInputs = [ ament-flake8 ament-lint-auto ament-lint-common ament-mypy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2nodl" = substituteSource {
      src = fetchgit {
        name = "ros2nodl-source";
        url = "https://github.com/ros2-gbp/nodl-release.git";
        rev = "2679a9a8576b1a19e2959239ab15a56d9d528a53";
        hash = "sha256-8JQgseO9AxfsDy2YuxQ/dojS/6MOLaCKwBGUX8hIgwk=";
      };
    };
  });
  meta = {
    description = "CLI tools for NoDL files.";
  };
})
