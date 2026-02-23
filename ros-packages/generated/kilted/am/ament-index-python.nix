{
  ament-copyright,
  ament-flake8,
  ament-mypy,
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
  pname = "ament_index_python";
  version = "1.11.3-1";
  src = finalAttrs.passthru.sources."ament_index_python";
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_index_python" = substituteSource {
      src = fetchgit {
        name = "ament_index_python-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "8c5ed2e13815535abf34517ffa870ef5a5673a10";
        hash = "sha256-QZg/urE4fV1p8k/tT+5SoNe8/UfnKIoLF0Cr0KFnUjg=";
      };
    };
  });
  meta = {
    description = "\n    Python API to access the ament resource index.\n  ";
  };
})
