{
  ament-copyright,
  ament-flake8,
  ament-pep257,
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
  version = "3.4.3-1";
  src = finalAttrs.passthru.sources."launch_xml";
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_xml" = substituteSource {
      src = fetchgit {
        name = "launch_xml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "099fe0b1376d476af3f6eda2394a74bf614b77b3";
        hash = "sha256-TU61/9ohr/Yb+Y51hGUeXTwjDgLDL2R5OMtzk1Tzp7w=";
      };
    };
  });
  meta = {
    description = "XML frontend for the launch package.";
  };
})
