{
  ament-copyright,
  ament-flake8,
  ament-pep257,
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
  version = "1.8.1-1";
  src = finalAttrs.passthru.sources."ament_index_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_index_python" = substituteSource {
      src = fetchgit {
        name = "ament_index_python-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "86457bacaeec03825e194c05e908a6fb2f9a6061";
        hash = "sha256-7lIMorXGjQYthb0K4PtdrLSyjiRuLQ9ixmanpMqP83Y=";
      };
    };
  });
  meta = {
    description = "Python API to access the ament resource index.";
  };
})
