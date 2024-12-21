{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_xml";
  version = "3.7.1-1";
  src = finalAttrs.passthru.sources."launch_xml";
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_xml" = substituteSource {
      src = fetchgit {
        name = "launch_xml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "e3e0a79716f12be7af7d766f0ae177e3a86311cc";
        hash = "sha256-l9dqR9UeocsJPghjCe1D/58zVWYDju8OvKwc5+wfeIc=";
      };
    };
  });
  meta = {
    description = "XML frontend for the launch package.";
  };
})
